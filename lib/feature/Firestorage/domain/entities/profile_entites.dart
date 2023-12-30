


import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? surname;
  final String? email;
  final DateTime? dateOfJoin;
  final String? profileUrl;
  final String? describeYourself;
  final String? lastLookedContents;

  const ProfileEntity({
    required this.uid,
    this.name,
    this.surname,
    this.email,
    this.dateOfJoin,
    this.profileUrl,
    this.describeYourself,
    this.lastLookedContents,
  });


  @override
  List<Object?> get props => [uid];
}