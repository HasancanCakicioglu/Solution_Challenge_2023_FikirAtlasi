import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';

class GetSearchedCommentsUsecase {
  final ServicesRepository repository;

  GetSearchedCommentsUsecase(this.repository);

  Future<Either<GoogleCloudFailure, List<String>>> call(String text) async {
    return await repository.getSearchedComments(text);
  }
}
