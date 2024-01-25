

import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';

class DownloadModelUsecase{
  final ServicesRepository repository;

  DownloadModelUsecase(this.repository);

  Future<bool> call(String model, {bool isWifiRequired = true})async {
    return await repository.downloadModel(model, isWifiRequired: isWifiRequired);
  }
}