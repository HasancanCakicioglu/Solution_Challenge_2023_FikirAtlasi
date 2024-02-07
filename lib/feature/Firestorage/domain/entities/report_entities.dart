import 'package:equatable/equatable.dart';

/// The model representing the report entity for the Idea Atlas application.
/// 
/// The [uid] and [date] parameters are required.
class ReportEntity extends Equatable {
  final String? uid;
  final DateTime? date;
  
  /// Creates an instance of [ReportEntity].
  const ReportEntity({
    this.uid,
    this.date,
  });

  @override
  List<Object?> get props => [uid];
}