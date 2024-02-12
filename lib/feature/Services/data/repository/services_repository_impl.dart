// ignore_for_file: implementation_imports

import 'package:dartz/dartz.dart';
import 'package:geoflutterfire2/src/point.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/data/datasources/local_datasource/services_local_datasource.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';

/// `ServicesRepositoryImpl` implements the `ServicesRepository` interface.
/// It serves as a bridge between the data layer (LocalDataSource) and the domain layer.
class ServicesRepositoryImpl implements ServicesRepository {
  /// Instance of the local data source responsible for handling local data operations.
  final ServicesLocalDataSource localDataSource;

  /// Creates a new instance of `ServicesRepositoryImpl`.
  /// Requires an instance of `ServicesLocalDataSource`.
  ServicesRepositoryImpl({
    required this.localDataSource,
  });

  /// Deletes a model from the local storage.
  /// Returns true if the operation is successful, false otherwise.
  @override
  Future<bool> deleteModel(String model) async {
    try {
      return await localDataSource.deleteModel(model);
    } catch (e) {
      return false;
    }
  }

  /// Downloads a model to the local storage.
  /// Returns true if the operation is successful, false otherwise.
  @override
  Future<bool> downloadModel(String model, {bool isWifiRequired = true}) async {
    try {
      return await localDataSource.downloadModel(model,
          isWifiRequired: isWifiRequired);
    } catch (e) {
      return false;
    }
  }

  /// Checks if a model is downloaded locally.
  /// Returns true if the model is downloaded, false otherwise.
  @override
  Future<bool> isModelDownloaded(String model) async {
    try {
      return await localDataSource.isModelDownloaded(model);
    } catch (e) {
      return false;
    }
  }

  /// Translates a given text.
  /// Returns the translated text if successful, null otherwise.
  @override
  Future<String?> translateText(String text) async {
    try {
      return await localDataSource.translateText(text);
    } catch (e) {
      return null;
    }
  }

  /// Retrieves a list of searched comments using Google Cloud API.
  /// Returns a `Right` containing the list if successful, `Left` with an error otherwise.
  @override
  Future<Either<GoogleCloudFailure, List<String>>> getSearchedComments(
      String text) async {
    try {
      return Right(await localDataSource.getSearchedComments(text));
    } catch (e) {
      return Left(GoogleCloudFailure(
        message: e.toString(),
        title: "Google Cloud Error",
      ));
    }
  }

  /// Converts latitude and longitude to a GeoFirePoint.
  @override
  GeoFirePoint getGeoFirePoint(double latitude, double longitude) {
    return localDataSource.getGeoFirePoint(latitude, longitude);
  }
}
