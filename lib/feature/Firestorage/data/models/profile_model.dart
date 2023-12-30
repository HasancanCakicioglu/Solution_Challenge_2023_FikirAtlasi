
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';

class ProfileModel extends ProfileEntity {

  const ProfileModel({
    required String uid,
    String? name,
    String? surname,
    String? email,
    DateTime? dateOfJoin,
    String? profileUrl,
    String? describeYourself,
    String? lastLookedContents,
  }) : super(
          uid: uid,
          name: name,
          surname: surname,
          email: email,
          dateOfJoin: dateOfJoin,
          profileUrl: profileUrl,
          describeYourself: describeYourself,
          lastLookedContents: lastLookedContents,
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
      lastLookedContents: json['lastLookedContents'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'surname': surname,
      'email': email,
      'dateOfJoin': dateOfJoin,
      'profileUrl': profileUrl,
      'describeYourself': describeYourself,
      'lastLookedContents': lastLookedContents,
    };
  }

  ProfileModel copyWith({
    required String uid,
    String? name,
    String? surname,
    String? email,
    DateTime? dateOfJoin,
    String? profileUrl,
    String? describeYourself,
    String? lastLookedContents,
  }) {
    return ProfileModel(
      uid: uid,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      dateOfJoin: dateOfJoin ?? this.dateOfJoin,
      profileUrl: profileUrl ?? this.profileUrl,
      describeYourself: describeYourself ?? this.describeYourself,
      lastLookedContents: lastLookedContents ?? this.lastLookedContents,
    );
  }

  factory ProfileModel.fromEntity(ProfileEntity profileEntity) => ProfileModel(
    uid: profileEntity.uid!,
    name: profileEntity.name,
    surname: profileEntity.surname,
    email: profileEntity.email,
    dateOfJoin: profileEntity.dateOfJoin,
    profileUrl: profileEntity.profileUrl,
    describeYourself: profileEntity.describeYourself,
    lastLookedContents: profileEntity.lastLookedContents,
  );

}