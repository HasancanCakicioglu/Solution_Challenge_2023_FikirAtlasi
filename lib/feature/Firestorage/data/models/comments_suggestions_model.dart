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
    List<String>? pdf,
    List<String>? images,
    List<String>? videos,  }) : super(
          uid: uid,
          profileId: profileId,
          commentProblemID: commentProblemID,
          title: title,
          text: text,
          date: date,
          hasGoogleMaps: hasGoogleMaps,
          likeCount: likeCount,
          pdf: pdf,
          images: images,
          videos: videos,
        );

  factory CommentSuggestionModel.fromJson(Map<String, dynamic> json) {
    return CommentSuggestionModel(
      uid: json['uid'],
      profileId: json['profileId'],
      commentProblemID: json['commentProblemID'],
      title: json['title'],
      text: json['text'],
      date: (json['date']),
      hasGoogleMaps: json['hasGoogleMaps'],
      likeCount: json['likeCount'],
      pdf: json['pdf']?.cast<String>(),
      images: json['images']?.cast<String>(),
      videos: json['videos']?.cast<String>(),
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
      'hasGoogleMaps': hasGoogleMaps,
      'likeCount': likeCount,
      'pdf': pdf,
      'images': images,
      'videos': videos,
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
    hasGoogleMaps: commentProblemEntity.hasGoogleMaps ?? false,
    likeCount: commentProblemEntity.likeCount!,
    pdf: commentProblemEntity.pdf,
    images: commentProblemEntity.images,
    videos: commentProblemEntity.videos,
  );

}