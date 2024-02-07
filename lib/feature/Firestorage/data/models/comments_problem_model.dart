import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';

/// A concrete implementation of [CommentProblemEntity] representing a comment problem model.
class CommentProblemModel extends CommentProblemEntity {
  /// Constructs a [CommentProblemModel] instance.
  const CommentProblemModel({
    required String? uid,
    required String? profileId,
    required String? title,
    required String? category,
    String? text,
    required String? date,
    required List<String>? tags,
    required int? likeCount,
    List<String>? pdf,
    List<String>? images,
    List<String>? videos,
    Map<String, dynamic>? geoFirePoint,
    String? profileName,
    String? profileImage,
    int? solutionCount,
  }) : super(
          uid: uid,
          profileId: profileId,
          title: title,
          category: category,
          text: text,
          date: date,
          tags: tags,
          likeCount: likeCount,
          pdf: pdf,
          images: images,
          videos: videos,
          geoFirePoint: geoFirePoint,
          profileName: profileName,
          profileImage: profileImage,
          solutionCount: solutionCount,
        );

  /// Constructs a [CommentProblemModel] instance from a JSON map.
  factory CommentProblemModel.fromJson(Map<String, dynamic> json) {
    return CommentProblemModel(
      uid: json['uid'],
      profileId: json['profileId'],
      title: json['title'],
      category: json['category'],
      text: json['text'],
      date: json['date'],
      tags: json['tags']?.cast<String>(),
      likeCount: json['likeCount'],
      pdf: json['pdf']?.cast<String>(),
      images: json['images']?.cast<String>(),
      videos: json['videos']?.cast<String>(),
      geoFirePoint: json['geoFirePoint'],
      profileImage: json['profileImage'],
      profileName: json['profileName'],
      solutionCount: json['solutionCount'],
    );
  }

  /// Converts this comment problem model to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'profileId': profileId,
      'title': title,
      'category': category,
      'text': text,
      'date': date,
      'tags': tags,
      'likeCount': likeCount,
      'pdf': pdf,
      'images': images,
      'videos': videos,
      'geoFirePoint': geoFirePoint,
      'profileImage': profileImage,
      'profileName': profileName,
      'solutionCount': solutionCount,
    };
  }

  @override
  CommentProblemModel copyWith({
    String? uid,
    String? profileId,
    String? title,
    String? category,
    String? text,
    String? date,
    List<String>? tags,
    int? likeCount,
    List<String>? pdf,
    List<String>? images,
    List<String>? videos,
    Map<String, dynamic>? geoFirePoint,
    String? profileName,
    String? profileImage,
    int? solutionCount,
  }) {
    return CommentProblemModel(
      uid: uid ?? this.uid,
      profileId: profileId ?? this.profileId,
      title: title ?? this.title,
      category: category ?? this.category,
      text: text ?? this.text,
      date: date ?? this.date,
      tags: tags ?? this.tags,
      likeCount: likeCount ?? this.likeCount,
      pdf: pdf ?? this.pdf,
      images: images ?? this.images,
      videos: videos ?? this.videos,
      geoFirePoint: geoFirePoint ?? this.geoFirePoint,
      profileImage: profileImage ?? this.profileImage,
      profileName: profileName ?? this.profileName,
      solutionCount: solutionCount ?? this.solutionCount,
    );
  }

  /// Constructs a [CommentProblemModel] instance from a [CommentProblemEntity].
  factory CommentProblemModel.fromEntity(
          CommentProblemEntity commentProblemEntity) =>
      CommentProblemModel(
        uid: commentProblemEntity.uid,
        profileId: commentProblemEntity.profileId,
        title: commentProblemEntity.title,
        category: commentProblemEntity.category,
        text: commentProblemEntity.text,
        date: commentProblemEntity.date,
        tags: commentProblemEntity.tags,
        likeCount: commentProblemEntity.likeCount,
        pdf: commentProblemEntity.pdf,
        images: commentProblemEntity.images,
        videos: commentProblemEntity.videos,
        geoFirePoint: commentProblemEntity.geoFirePoint,
        profileName: commentProblemEntity.profileName,
        profileImage: commentProblemEntity.profileImage,
        solutionCount: commentProblemEntity.solutionCount,
      );
}

