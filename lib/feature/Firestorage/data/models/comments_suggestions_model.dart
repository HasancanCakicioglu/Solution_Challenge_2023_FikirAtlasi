import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';

class CommentSuggestionModel extends CommentSuggestionEntity {
  const CommentSuggestionModel({
    required String uid,
    required String profileId,
    required String commentProblemID,
    required String title,
    String? text,
    required DateTime date,
    String? photoURL,
    String? videoURL,
    required bool hasGoogleMaps,
    required int likeCount,
    String? pdf,
  }) : super(
          uid: uid,
          profileId: profileId,
          commentProblemID: commentProblemID,
          title: title,
          text: text,
          date: date,
          photoURL: photoURL,
          videoURL: videoURL,
          hasGoogleMaps: hasGoogleMaps,
          likeCount: likeCount,
          pdf: pdf,
        );

  factory CommentSuggestionModel.fromJson(Map<String, dynamic> json) {
    return CommentSuggestionModel(
      uid: json['uid'],
      profileId: json['profileId'],
      commentProblemID: json['commentProblemID'],
      title: json['title'],
      text: json['text'],
      date: (json['date'] as Timestamp).toDate(),
      photoURL: json['photoURL'],
      videoURL: json['videoURL'],
      hasGoogleMaps: json['hasGoogleMaps'],
      likeCount: json['likeCount'],
      pdf: json['pdf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'profileId': profileId,
      'commentProblemID': commentProblemID,
      'title': title,
      'text': text,
      'date': date,
      'photoURL': photoURL,
      'videoURL': videoURL,
      'hasGoogleMaps': hasGoogleMaps,
      'likeCount': likeCount,
      'pdf': pdf,
    };
  }



  //from entity
  factory CommentSuggestionModel.fromEntity(CommentSuggestionEntity commentProblemEntity) => CommentSuggestionModel(
    uid: commentProblemEntity.uid!,
    commentProblemID: commentProblemEntity.commentProblemID!,
    profileId: commentProblemEntity.profileId!,
    title: commentProblemEntity.title!,
    text: commentProblemEntity.text,
    date: commentProblemEntity.date!,
    photoURL: commentProblemEntity.photoURL,
    videoURL: commentProblemEntity.videoURL,
    hasGoogleMaps: commentProblemEntity.hasGoogleMaps ?? false,
    likeCount: commentProblemEntity.likeCount!,
    pdf: commentProblemEntity.pdf,
  );

}