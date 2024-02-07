import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';

/// A concrete implementation of [CommentSuggestionEntity] representing a comment suggestion model.
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
    String? profileName,
    String? profileImage,
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
          profileName: profileName,
          profileImage: profileImage,
        );

  /// Constructs a [CommentSuggestionModel] instance from a JSON map.
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
      profileName: json['profileName'],
      profileImage: json['profileImage'],
    );
  }

  /// Converts a [CommentSuggestionModel] instance to a JSON map.
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
      'profileName': profileName,
      'profileImage': profileImage,
    };
  }

  /// Constructs a [CommentSuggestionModel] instance from a [CommentSuggestionEntity] instance.
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
        profileName: commentProblemEntity.profileName,
        profileImage: commentProblemEntity.profileImage,
      );

  /// Converts a [CommentSuggestionModel] instance to a [CommentSuggestionEntity] instance.
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
    String? profileName,
    String? profileImage,
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
      profileName: profileName ?? this.profileName,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
