

import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';

abstract class ServicesRepository{

    // Google ml-kit translation
    Future<bool> isModelDownloaded(String model);
    Future<bool> deleteModel(String model);
    Future<String?> translateText(String text);
    Future<bool> downloadModel(String model, {bool isWifiRequired = true});


    // Google cloud function
    Future<Either<GoogleCloudFailure,List<String>>> getSearchedComments(String text);


}