import 'dart:io';

import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class UploadFilesUsecase {
  final FirestoreRepository repository;

  UploadFilesUsecase(this.repository);

  Future<Map<String, List<String>>> call(
      FirestoreAllowedFileTypes firestoreAllowedFileTypes,
      List<File> files) async {
    return await repository.uploadFiles(firestoreAllowedFileTypes, files);
  }
}
