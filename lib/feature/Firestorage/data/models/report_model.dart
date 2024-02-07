import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/report_entities.dart';

/// A concrete implementation of [ReportEntity] representing a report model.
class ReportModel extends ReportEntity{

  const ReportModel({
    String? uid,
    DateTime? date,
  }) : super(
    uid: uid,
    date: date,
  );

  /// Constructs a [ReportModel] instance from a JSON map.
  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    uid: json["uid"],
    date: json["date"],
  );

  /// Converts a [ReportModel] instance to a JSON map.
  factory ReportModel.fromEntity(ReportEntity reportEntity) => ReportModel(
    uid: reportEntity.uid,
    date: reportEntity.date,
  );

  /// Converts a [ReportModel] instance to a JSON map.
  Map<String, dynamic> toJson() => {
    "uid": uid,
    "date": date,
  }; 
  
}
