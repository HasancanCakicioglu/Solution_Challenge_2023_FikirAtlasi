
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';

class CommentProblemModel extends CommentProblemEntity {

  const CommentProblemModel({
    required String uid,
    required String profileId,
    required String title,
    required String category,
    String? text,
    required DateTime date,
    required List<String> tags,
    String? photoURL,
    String? videoURL,
    bool? hasGoogleMaps,
    required int likeCount,
    String? pdf,
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
        );

  factory CommentProblemModel.fromJson(Map<String, dynamic> json) {
    return CommentProblemModel(
      uid: json['uid'],
      profileId: json['profileId'],
      title: json['title'],
      category: json['category'],
      text: json['text'],
      date: DateTime.parse(json['date']),
      tags: json['tags'].cast<String>(),
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
    };
  }

  factory CommentProblemModel.fromEntity(CommentProblemEntity commentProblemEntity) => CommentProblemModel(
    uid: commentProblemEntity.uid!,
    profileId: commentProblemEntity.profileId!,
    title: commentProblemEntity.title!,
    category: commentProblemEntity.category!,
    text: commentProblemEntity.text,
    date: commentProblemEntity.date!,
    tags: commentProblemEntity.tags!,
    photoURL: commentProblemEntity.photoURL,
    videoURL: commentProblemEntity.videoURL,
    hasGoogleMaps: commentProblemEntity.hasGoogleMaps,
    likeCount: commentProblemEntity.likeCount!,
    pdf: commentProblemEntity.pdf,
  );

}