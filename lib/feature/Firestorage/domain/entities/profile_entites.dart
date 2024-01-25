import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? surname;
  final String? email;
  final String? dateOfJoin;
  final String? profileUrl;
  final String? describeYourself;
  final List<String>? lastLookedContents;

  const ProfileEntity({
    this.uid,
    this.name,
    this.surname,
    this.email,
    this.dateOfJoin,
    this.profileUrl,
    this.describeYourself,
    this.lastLookedContents,
  });

  @override
  String toString() {
    return 'ProfileEntity{uid: $uid, name: $name, surname: $surname, email: $email, dateOfJoin: $dateOfJoin, profileUrl: $profileUrl, describeYourself: $describeYourself, lastLookedContents: $lastLookedContents}';
  }

  @override
  List<Object?> get props => [
        uid,
        name,
        surname,
        email,
        dateOfJoin,
        profileUrl,
        describeYourself,
        lastLookedContents
      ];
}
