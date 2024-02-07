
import 'package:equatable/equatable.dart';


/// The model representing the comment problem entity for the Idea Atlas application.
/// 
/// The [uid], [profileId], [title], [category], [text], [date], [tags], [likeCount], [pdf], [images], [videos], [geoFirePoint], [profileName], and [profileImage] parameters are required.
class CommentProblemEntity extends Equatable {
  final String? uid;
  final String? profileId;
  final String? title;
  final String? category;
  final String? text;
  final String? date;
  final List<String>? tags;
  final int? likeCount;
  final Map<String, dynamic>? geoFirePoint;

  final List<String>? pdf;
  final List<String>? images;
  final List<String>? videos;

  final String? profileName;
  final String? profileImage;
  final int? solutionCount;



  const CommentProblemEntity( {
    this.uid,
    this.profileId,
    this.title,
    this.category,
    this.text,
    this.date,
    this.tags,
    this.likeCount,
    this.pdf,
    this.images,
    this.videos,
    this.geoFirePoint,
    this.profileName,
    this.profileImage,
    this.solutionCount
  });

  @override
  List<Object?> get props => [
        uid,
        profileId,
        title,
        category,
        text,
        date,
        tags,
        likeCount,
        pdf,
        images,
        videos,
        geoFirePoint,
        profileName,
        profileImage,
        solutionCount
      ];

  CommentProblemEntity copyWith({
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
    return CommentProblemEntity(
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
      profileName: profileName ?? this.profileName,
      profileImage: profileImage ?? this.profileImage,
      solutionCount: solutionCount ?? this.solutionCount,
    );
  }
}
