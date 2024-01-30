import 'dart:io';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class SelectFilesUsecase{
  final FirestoreRepository repository;

  SelectFilesUsecase(this.repository);

  Future<List<File>?> call() async {
    return await repository.selectFiles();
  }
}