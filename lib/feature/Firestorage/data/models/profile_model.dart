
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';

class ProfileModel extends ProfileEntity {

  const ProfileModel({
    String? uid,
    String? name,
    String? surname,
    String? email,
    String? dateOfJoin,
    String? profileUrl,
    String? describeYourself,
    List<String>? lastLookedContents,
    final String? fcmToken,
    Map<String, dynamic>? geoFirePoint,
    bool? isNotificationOpen,
  }) : super(
          uid: uid,
          name: name,
          surname: surname,
          email: email,
          dateOfJoin: dateOfJoin,
          profileUrl: profileUrl,
          describeYourself: describeYourself,
          lastLookedContents: lastLookedContents,
          fcmToken: fcmToken,
          geoFirePoint: geoFirePoint,
          isNotificationOpen: isNotificationOpen,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      uid: json['uid'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      dateOfJoin: json['dateOfJoin'],
      profileUrl: json['profileUrl'],
      describeYourself: json['describeYourself'],
      lastLookedContents: json['lastLookedContents'].cast<String>(),
      fcmToken: json['fcmToken'],
      geoFirePoint: json['geoFirePoint'],
      isNotificationOpen: json['isNotificationOpen'],
    );
  }

  Map<String, dynamic> toJson() {
  return {
    if (uid != null) 'uid': uid,
    if (name != null) 'name': name,
    if (surname != null) 'surname': surname,
    if (email != null) 'email': email,
    if (dateOfJoin != null) 'dateOfJoin': dateOfJoin,
    if (profileUrl != null) 'profileUrl': profileUrl,
    if (describeYourself != null) 'describeYourself': describeYourself,
    if (lastLookedContents != null) 'lastLookedContents': lastLookedContents,
    if (fcmToken != null) 'fcmToken': fcmToken,
    if (geoFirePoint != null) 'geoFirePoint': geoFirePoint,
    if (isNotificationOpen != null) 'isNotificationOpen': isNotificationOpen,
  };
}

  ProfileModel copyWith({
    String? uid,
    String? name,
    String? surname,
    String? email,
    String? dateOfJoin,
    String? profileUrl,
    String? describeYourself,
    List<String>? lastLookedContents,
    String? fcmToken,
    Map<String, dynamic>? geoFirePoint,
    bool? isNotificationOpen,
  }) {
    return ProfileModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      dateOfJoin: dateOfJoin ?? this.dateOfJoin,
      profileUrl: profileUrl ?? this.profileUrl,
      describeYourself: describeYourself ?? this.describeYourself,
      lastLookedContents: lastLookedContents ?? this.lastLookedContents,
      fcmToken: fcmToken ?? this.fcmToken,
      geoFirePoint: geoFirePoint ?? this.geoFirePoint,
      isNotificationOpen: isNotificationOpen ?? this.isNotificationOpen,
    );
  }

  factory ProfileModel.fromEntity(ProfileEntity profileEntity) => ProfileModel(
    uid: profileEntity.uid,
    name: profileEntity.name,
    surname: profileEntity.surname,
    email: profileEntity.email,
    dateOfJoin: profileEntity.dateOfJoin,
    profileUrl: profileEntity.profileUrl,
    describeYourself: profileEntity.describeYourself,
    lastLookedContents: profileEntity.lastLookedContents,
    fcmToken: profileEntity.fcmToken,
    geoFirePoint: profileEntity.geoFirePoint,
    isNotificationOpen: profileEntity.isNotificationOpen,
  );

}