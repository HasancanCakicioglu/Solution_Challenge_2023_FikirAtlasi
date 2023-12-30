import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ProfileEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? surname;
  final String? email;
  final DateTime? dateOfJoin;
  final bool? verified;
  final String? profileUrl;
  final String? describeYourself;
  final String? lastLookedContents;

  const ProfileEntity({
    this.uid,
    this.name,
    this.surname,
    this.email,
    this.dateOfJoin,
    this.verified,
    this.profileUrl,
    this.describeYourself,
    this.lastLookedContents,
  });

  @override

  List<Object?> get props => [
        uid,
      ];
}