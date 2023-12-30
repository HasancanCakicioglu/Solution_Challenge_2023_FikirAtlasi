import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/report_entities.dart';


class ReportModel extends ReportEntity{

  const ReportModel({
    String? uid,
    DateTime? date,
  }) : super(
    uid: uid,
    date: date,
  );

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    uid: json["uid"],
    date: json["date"],
  );

  factory ReportModel.fromEntity(ReportEntity reportEntity) => ReportModel(
    uid: reportEntity.uid,
    date: reportEntity.date,
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "date": date,
  }; 
  
}
