import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// A page view widget for displaying Google Maps.
///
/// This widget allows users to interact with Google Maps, select a location by tapping on the map,
/// and confirm their selected location.
@RoutePage<LatLng?>()
class GoogleMapsPageView extends StatefulWidget {
  /// Creates a [GoogleMapsPageView].
  const GoogleMapsPageView({Key? key}) : super(key: key);

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

  /// Set of markers for displaying on the map.
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('googlemaps'.tr()),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kIstanbul,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap: (LatLng location) {
          _addMarker(location);
        },
        markers: markers,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 3),
        child: FloatingActionButton.extended(
          onPressed: () {
            if (markers.isNotEmpty) {
              // Handle button press
            }
          },
          label: InkWell(
            onTap: () {
              selectedLocation = markers.first.position;
              context.router.pop(selectedLocation);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8.0),
                  const Text('selectlocation').tr(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Adds a marker to the map at the specified [location].
  void _addMarker(LatLng location) {
    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: const MarkerId('selected-location'),
          position: location,
          infoWindow: InfoWindow(title: 'selectedLocation'.tr()),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed),
        ),
      );
    });
  }
}
