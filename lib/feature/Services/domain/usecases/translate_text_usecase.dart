

import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/repository/services_repository.dart';

class TranslateTextUsecase{
  final ServicesRepository repository;

  TranslateTextUsecase(this.repository);

  Future<String?> call(String text)async {
    return await repository.translateText(text);
  }
}