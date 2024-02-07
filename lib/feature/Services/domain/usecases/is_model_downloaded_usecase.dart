import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';

class IsModelDownloadedUsecase {
  final ServicesRepository repository;

  IsModelDownloadedUsecase(this.repository);

  Future<bool> call(String model) async {
    return await repository.isModelDownloaded(model);
  }
}
