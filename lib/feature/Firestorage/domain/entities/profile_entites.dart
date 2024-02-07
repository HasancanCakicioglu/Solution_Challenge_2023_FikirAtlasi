import 'package:equatable/equatable.dart';

/// The model representing the profile entity for the Idea Atlas application.
/// 
/// The [uid], [name], [surname], [email], [dateOfJoin], [profileUrl], [describeYourself], [lastLookedContents], [fcmToken], [geoFirePoint], [isNotificationOpen], [problemIDs], and [solutionIDs] parameters are required.
class ProfileEntity extends Equatable {
  final String? uid;
  final String? name;
  final String? surname;
  final String? email;
  final String? dateOfJoin;
  final String? profileUrl;
  final String? describeYourself;
  final List<String>? lastLookedContents;
  final String? fcmToken;
  final Map<String, dynamic>? geoFirePoint;
  final bool? isNotificationOpen;
  final List<String>? problemIDs;
  final List<String>? solutionIDs;

  const ProfileEntity(
      {this.uid,
      this.name,
      this.surname,
      this.email,
      this.dateOfJoin,
      this.profileUrl,
      this.describeYourself,
      this.lastLookedContents,
      this.fcmToken,
      this.geoFirePoint,
      this.isNotificationOpen,
      this.problemIDs,
      this.solutionIDs
      });

  @override
  String toString() {
    return 'ProfileEntity{uid: $uid, name: $name, surname: $surname, email: $email, dateOfJoin: $dateOfJoin, profileUrl: $profileUrl, describeYourself: $describeYourself, lastLookedContents: $lastLookedContents , geofirePoint: $geoFirePoint } ';
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
        lastLookedContents,
        fcmToken,
        geoFirePoint,
        isNotificationOpen,
        problemIDs,
        solutionIDs
      ];
}
