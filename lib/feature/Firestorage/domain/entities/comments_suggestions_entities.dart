
import 'package:equatable/equatable.dart';

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
      ];
}
