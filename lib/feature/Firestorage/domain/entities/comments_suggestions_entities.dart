
import 'package:equatable/equatable.dart';

class CommentSuggestionEntity extends Equatable {
  final String? uid;
  final String? profileId;
  final String? commentProblemID;
  final String? title;
  final String? text;
  final DateTime? date;
  final String? photoURL;
  final String? videoURL;
  final bool? hasGoogleMaps;
  final int? likeCount;
  final String? pdf;

  const CommentSuggestionEntity({
    this.uid,
    this.profileId,
    this.commentProblemID,
    this.title,
    this.text,
    this.date,
    this.photoURL,
    this.videoURL,
    this.hasGoogleMaps,
    this.likeCount,
    this.pdf,
  });

  @override
  List<Object?> get props => [
        uid,
        profileId,
        commentProblemID,
        title,
        text,
        date,
        photoURL,
        videoURL,
        hasGoogleMaps,
        likeCount,
        pdf,
      ];
}
