import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';

class CommentSuggestionModel extends CommentSuggestionEntity {
  const CommentSuggestionModel({
    required String? uid,
    required String? profileId,
    required String? commentProblemID,
    String? text,
    required String? date,
    String? photoURL,
    String? videoURL,
    required int? likeCount,
    List<String>? pdf,
    List<String>? images,
    List<String>? videos,
  }) : super(
          uid: uid,
          profileId: profileId,
          commentProblemID: commentProblemID,
          text: text,
          date: date,
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
      text: json['text'],
      date: (json['date']),
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
      'text': text,
      'date': date,
      'likeCount': likeCount,
      'pdf': pdf,
      'images': images,
      'videos': videos,
    };
  }

  //from entity
  factory CommentSuggestionModel.fromEntity(
          CommentSuggestionEntity commentProblemEntity) =>
      CommentSuggestionModel(
        uid: commentProblemEntity.uid,
        commentProblemID: commentProblemEntity.commentProblemID,
        profileId: commentProblemEntity.profileId,
        text: commentProblemEntity.text,
        date: commentProblemEntity.date,
        likeCount: commentProblemEntity.likeCount,
        pdf: commentProblemEntity.pdf,
        images: commentProblemEntity.images,
        videos: commentProblemEntity.videos,
      );

  CommentSuggestionModel copyWith({
    String? uid,
    String? profileId,
    String? commentProblemID,
    String? text,
    String? date,
    int? likeCount,
    List<String>? pdf,
    List<String>? images,
    List<String>? videos,
  }) {
    return CommentSuggestionModel(
      uid: uid ?? this.uid,
      profileId: profileId ?? this.profileId,
      commentProblemID: commentProblemID ?? this.commentProblemID,
      text: text ?? this.text,
      date: date ?? this.date,
      likeCount: likeCount ?? this.likeCount,
      pdf: pdf ?? this.pdf,
      images: images ?? this.images,
      videos: videos ?? this.videos,
    );
  }
}
