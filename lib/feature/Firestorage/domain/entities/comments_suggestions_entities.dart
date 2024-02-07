
import 'package:equatable/equatable.dart';

/// The model representing the comment suggestion entity for the Idea Atlas application.
/// 
/// The [uid], [profileId], [commentProblemID], [text], [date], [likeCount], [pdf], [images], [videos], [profileName], and [profileImage] parameters are required.
class CommentSuggestionEntity extends Equatable {
  final String? uid;
  final String? profileId;
  final String? commentProblemID;
  final String? text;
  final String? date;
  final int? likeCount;
  final List<String>? pdf;
  final List<String>? images;
  final List<String>? videos;
  final String? profileName;
  final String? profileImage;

  const CommentSuggestionEntity({
    this.uid,
    this.profileId,
    this.commentProblemID,
    this.text,
    this.date,
    this.likeCount,
    this.pdf,
    this.images,
    this.videos,
    this.profileName,
    this.profileImage,
  });

  @override
  List<Object?> get props => [
        uid,
        profileId,
        commentProblemID,
        text,
        date,
        likeCount,
        pdf,
        images,
        videos,
        profileName,
        profileImage
      ];
}
