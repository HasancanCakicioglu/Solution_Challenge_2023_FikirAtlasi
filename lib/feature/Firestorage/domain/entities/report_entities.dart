

import 'package:equatable/equatable.dart';

class ReportEntity extends Equatable {
  final String? uid;
  final DateTime? date;
  
  const ReportEntity({
    this.uid,
    this.date,
  });

  @override
  List<Object?> get props => [uid];
}