import 'dart:async';
import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

abstract class ServicesLocalDataSource {
  Future<bool> isModelDownloaded(String model);
  Future<bool> deleteModel(String model);
  Future<String?> translateText(String text);
  Future<bool> downloadModel(String model, {bool isWifiRequired = true});

  Future<List<String>> getSearchedComments(String text);
}

class ServicesLocalDataSourceImpl implements ServicesLocalDataSource {
  final OnDeviceTranslatorModelManager onDeviceTranslatorModelManager;
  final OnDeviceTranslator onDeviceTranslator;

  ServicesLocalDataSourceImpl(
      {required this.onDeviceTranslatorModelManager,
      required this.onDeviceTranslator});

  @override
  Future<bool> deleteModel(String model) async {
    final bool response =
        await onDeviceTranslatorModelManager.deleteModel(model);
    return response;
  }

  @override
  Future<bool> downloadModel(String model, {bool isWifiRequired = true}) async {
    final bool response = await onDeviceTranslatorModelManager
        .downloadModel(model, isWifiRequired: isWifiRequired);
    return response;
  }

  @override
  Future<bool> isModelDownloaded(String model) async {
    final bool response =
        await onDeviceTranslatorModelManager.isModelDownloaded(model);
    return response;
  }

  @override
  Future<String?> translateText(String text) async {
    final String response = await onDeviceTranslator.translateText(text);
    return response;
  }

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
}
