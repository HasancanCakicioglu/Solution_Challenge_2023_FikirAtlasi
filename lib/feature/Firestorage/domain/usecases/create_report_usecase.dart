import 'package:dartz/dartz.dart';
import 'package:solution_challenge_2023_recommender_app/core/errors/failure/failure.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/report_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/repository/firestore_repository.dart';

class CreateReportUsecase{
  final FirestoreRepository repository;

  CreateReportUsecase(this.repository);

  Future<Either<FirebaseUnknowFailure, void>> call(ReportEntity reportEntity)async {
    return await repository.createReport(reportEntity);
  }
}