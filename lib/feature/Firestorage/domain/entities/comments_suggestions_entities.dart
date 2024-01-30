
import 'package:equatable/equatable.dart';

class CommentSuggestionEntity extends Equatable {
  final String? uid;
  final String? profileId;
  final String? commentProblemID;
  final String? title;
  final String? text;
  final DateTime? date;
  final bool? hasGoogleMaps;
  final int? likeCount;

  final List<String>? pdf;
  final List<String>? images;
  final List<String>? videos;

  const CommentSuggestionEntity({
    this.uid,
    this.profileId,
    this.commentProblemID,
    this.title,
    this.text,
    this.date,
    this.hasGoogleMaps,
    this.likeCount,
    this.pdf,
    this.images,
    this.videos,
  });

  @override
  List<Object?> get props => [
        uid,
        profileId,
        commentProblemID,
        title,
        text,
        date,
        hasGoogleMaps,
        likeCount,
        pdf,
        images,
        videos,
      ];
}
