import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/data/datasources/local_datasource/services_local_datasource.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';

class ServicesRepositoryImpl implements ServicesRepository {
  final ServicesLocalDataSource localDataSource;

  ServicesRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<bool> deleteModel(String model) async {
    try {
      return await localDataSource.deleteModel(model);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> downloadModel(String model, {bool isWifiRequired = true}) async {
    try {
      return await localDataSource.downloadModel(model, isWifiRequired: isWifiRequired);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isModelDownloaded(String model) async {
    try {
      return await localDataSource.isModelDownloaded(model);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> translateText(String text) async {
    try {
      return await localDataSource.translateText(text);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<GoogleCloudFailure, List<String>>> getSearchedComments(String text) async{
    
    try{
      return Right(await localDataSource.getSearchedComments(text));
    }catch(e){
      return Left(GoogleCloudFailure(
        message: e.toString(),
        title: "Google Cloud Error",
      ));
    }
  }

}
