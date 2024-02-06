import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class SelectFilesUsecase{
  final FirestoreRepository repository;

  SelectFilesUsecase(this.repository);

  Future<List<File>?> call(FileType fileType) async {
    return await repository.selectFiles(fileType);
  }
}