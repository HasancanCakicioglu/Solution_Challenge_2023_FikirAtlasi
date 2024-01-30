import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage<LatLng?>()
class GoogleMapsPageView extends StatefulWidget {
  const GoogleMapsPageView({super.key});

  @override
  State<GoogleMapsPageView> createState() => GoogleMapsPageViewState();
}

class GoogleMapsPageViewState extends State<GoogleMapsPageView> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late final LatLng? selectedLocation;

  static const CameraPosition _kIstanbul = CameraPosition(
    target: LatLng(41.0082, 28.9784),
    zoom: 14.0,
  );

  Set<Marker> markers = {}; // Yeni eklenen satır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Maps'),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kIstanbul,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onTap: (LatLng location) {
            _addMarker(location); // Seçilen konuma marker ekle
          },
          markers:
              markers, // Marker'ları göstermek için markers özelliğini kullan
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 3),
          child: FloatingActionButton.extended(
              onPressed: () {
                if (markers.isNotEmpty) {
                  // İlk marker'ın konumunu al
                  var selectedMarker = markers.first;
                  print(
                      'Seçilen Konum: ${selectedMarker.position.latitude}, ${selectedMarker.position.longitude}');
                } else {
                  print('Lütfen bir konum seçin.');
                }
              },
              label: InkWell(
                onTap: (){
                  selectedLocation = markers.first.position;
                  context.router.pop(selectedLocation);
                },
                child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 8.0), // Sola kaydırmak için boşluk ekleyin
                    Text('Konumu Seçin'),
                  ],
                ),
              ),
              )),
        ));
  }

  void _addMarker(LatLng location) {
    setState(() {
      markers.clear(); // Önceki marker'ları temizle
      markers.add(
        Marker(
          markerId: MarkerId('selected-location'),
          position: location,
          infoWindow: InfoWindow(title: 'Seçilen Konum'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        ),
      );
    });
  }
}
