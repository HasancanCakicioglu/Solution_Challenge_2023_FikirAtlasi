import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

class GetCurrentUIdUsecase{
  final AuthRepository repository;

  GetCurrentUIdUsecase(this.repository);

  Future<String?> call(){
    return repository.getCurrentUId();
  }
}