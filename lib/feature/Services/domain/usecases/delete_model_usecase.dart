

import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';

class DeleteModelUsecase{
  final ServicesRepository repository;

  DeleteModelUsecase(this.repository);

  Future<bool> call(String model)async {
    return await repository.deleteModel(model);
  }
}




