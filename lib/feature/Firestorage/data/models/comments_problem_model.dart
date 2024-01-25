import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';

class CommentProblemModel extends CommentProblemEntity {

  const CommentProblemModel({
    required String? uid,
    required String? profileId,
    required String? title,
    required String? category,
    String? text,
    required String? date,
    required List<String>? tags,
    String? photoURL,
    String? videoURL,
    bool? hasGoogleMaps,
    required int? likeCount,
    List<String>? pdf,
    List<String>? images,
    List<String>? videos,
  }) : super(
          uid: uid,
          profileId: profileId,
          title: title,
          category: category,
          text: text,
          date: date,
          tags: tags,
          photoURL: photoURL,
          videoURL: videoURL,
          hasGoogleMaps: hasGoogleMaps,
          likeCount: likeCount,
          pdf: pdf,
          images: images,
          videos: videos,
        );

  factory CommentProblemModel.fromJson(Map<String, dynamic> json) {
    return CommentProblemModel(
      uid: json['uid'],
      profileId: json['profileId'],
      title: json['title'],
      category: json['category'],
      text: json['text'],
      date: (json['date']),
      tags: json['tags']?.cast<String>(),
      photoURL: json['photoURL'],
      videoURL: json['videoURL'],
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
      'title': title,
      'category': category,
      'text': text,
      'date': date,
      'tags': tags,
      'photoURL': photoURL,
      'videoURL': videoURL,
      'hasGoogleMaps': hasGoogleMaps,
      'likeCount': likeCount,
      'pdf': pdf,
      'images': images,
      'videos': videos,
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
      String? photoURL,
      String? videoURL,
      bool? hasGoogleMaps,
      int? likeCount,
      List<String>? pdf,
      List<String>? images,
      List<String>? videos,
    }) {
      return CommentProblemModel(
        uid: uid ?? this.uid,
        profileId: profileId ?? this.profileId,
        title: title ?? this.title,
        category: category ?? this.category,
        text: text ?? this.text,
        date: date ?? this.date,
        tags: tags ?? this.tags,
        photoURL: photoURL ?? this.photoURL,
        videoURL: videoURL ?? this.videoURL,
        hasGoogleMaps: hasGoogleMaps ?? this.hasGoogleMaps,
        likeCount: likeCount ?? this.likeCount,
        pdf: pdf ?? this.pdf,
        images: images ?? this.images,
        videos: videos ?? this.videos,
      );
    }






  factory CommentProblemModel.fromEntity(CommentProblemEntity commentProblemEntity) => CommentProblemModel(
    uid: commentProblemEntity.uid,
    profileId: commentProblemEntity.profileId,
    title: commentProblemEntity.title,
    category: commentProblemEntity.category,
    text: commentProblemEntity.text,
    date: commentProblemEntity.date,
    tags: commentProblemEntity.tags,
    photoURL: commentProblemEntity.photoURL,
    videoURL: commentProblemEntity.videoURL,
    hasGoogleMaps: commentProblemEntity.hasGoogleMaps,
    likeCount: commentProblemEntity.likeCount,
    pdf: commentProblemEntity.pdf,
    images: commentProblemEntity.images,
    videos: commentProblemEntity.videos,
  );

}