import 'dart:async';
import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

/// Abstract class defining the local data source interface for services.
abstract class ServicesLocalDataSource {
  Future<bool> isModelDownloaded(String model);
  Future<bool> deleteModel(String model);
  Future<String?> translateText(String text);
  Future<bool> downloadModel(String model, {bool isWifiRequired});
  Future<List<String>> getSearchedComments(String text);
  GeoFirePoint getGeoFirePoint(double latitude, double longitude);
}

/// Implementation of the `ServicesLocalDataSource` interface.
class ServicesLocalDataSourceImpl implements ServicesLocalDataSource {
  final OnDeviceTranslatorModelManager onDeviceTranslatorModelManager;
  final OnDeviceTranslator onDeviceTranslator;
  final GeoFlutterFire geo;

  /// Constructor that requires instances of `OnDeviceTranslatorModelManager`, `OnDeviceTranslator`, and `GeoFlutterFire`.
  ServicesLocalDataSourceImpl({
    required this.onDeviceTranslatorModelManager,
    required this.onDeviceTranslator,
    required this.geo,
  });

  /// Deletes a downloaded model from the device.
  /// Returns true if the operation is successful, false otherwise.
  @override
  Future<bool> deleteModel(String model) async {
    final bool response =
        await onDeviceTranslatorModelManager.deleteModel(model);
    return response;
  }

  /// Downloads a language translation model to the device.
  /// Returns true if the operation is successful, false otherwise.
  @override
  Future<bool> downloadModel(String model, {bool isWifiRequired = true}) async {
    final bool response = await onDeviceTranslatorModelManager
        .downloadModel(model, isWifiRequired: isWifiRequired);
    return response;
  }

  /// Checks if a language translation model is downloaded to the device.
  /// Returns true if the model is downloaded, false otherwise.
  @override
  Future<bool> isModelDownloaded(String model) async {
    final bool response =
        await onDeviceTranslatorModelManager.isModelDownloaded(model);
    return response;
  }

  /// Translates a given text using on-device translation.
  /// Returns the translated text if successful, null otherwise.
  @override
  Future<String?> translateText(String text) async {
    final String response = await onDeviceTranslator.translateText(text);
    return response;
  }

  /// Retrieves a list of searched comments using a cloud function.
  /// Returns the list if successful, an empty list otherwise.
  @override
  Future<List<String>> getSearchedComments(String text) async {
    HttpsCallable callable =
        FirebaseFunctions.instanceFor(region: 'europe-west3').httpsCallable(
      'semanticSearch',
      options: HttpsCallableOptions(
        timeout: const Duration(seconds: 10),
      ),
    );
    HttpsCallableResult jsonList =
        await callable(<String, String>{"text": text});

    List<String> stringList = List<String>.from(json.decode(jsonList.data));
    return stringList;
  }

  /// Creates a GeoFirePoint using latitude and longitude.
  @override
  GeoFirePoint getGeoFirePoint(double latitude, double longitude) {
    return geo.point(latitude: latitude, longitude: longitude);
  }
}
