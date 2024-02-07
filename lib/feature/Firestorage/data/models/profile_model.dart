
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';

/// A concrete implementation of [ProfileEntity] representing a profile model.
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
    List<String>? problemIDs,
    List<String>? solutionIDs,
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
          problemIDs: problemIDs,
          solutionIDs: solutionIDs,
        );
  
  /// Constructs a [ProfileModel] instance from a JSON map.
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      uid: json['uid'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      dateOfJoin: json['dateOfJoin'],
      profileUrl: json['profileUrl'],
      describeYourself: json['describeYourself'],
      lastLookedContents: json['lastLookedContents']?.cast<String>(),
      fcmToken: json['fcmToken'],
      geoFirePoint: json['geoFirePoint'],
      isNotificationOpen: json['isNotificationOpen'],
      problemIDs: json['problemIDs']?.cast<String>(),
      solutionIDs : json['solutionIDs']?.cast<String>(),
    );
  }
  /// Converts a [ProfileModel] instance to a JSON map.
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
    if (problemIDs != null) 'problemIDs': problemIDs,
    if (solutionIDs != null) 'solutionIDs': solutionIDs,
  };
}
  /// Constructs a [ProfileModel] instance from a [ProfileEntity] instance.
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
    List<String>? problemIDs,
    List<String>? solutionIDs,
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
      problemIDs: problemIDs ?? this.problemIDs,
      solutionIDs: solutionIDs ?? this.solutionIDs,
    );
  }
  /// Constructs a [ProfileModel] instance from a [ProfileEntity] instance.
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
    problemIDs: profileEntity.problemIDs,
    solutionIDs: profileEntity.solutionIDs,
  );

}