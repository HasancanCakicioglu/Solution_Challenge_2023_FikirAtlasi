
import 'package:equatable/equatable.dart';

class CommentProblemEntity extends Equatable {
  final String? uid;
  final String? profileId;
  final String? title;
  final String? category;
  final String? text;
  final DateTime? date;
  final List<String>? tags;
  final String? photoURL;
  final String? videoURL;
  final bool? hasGoogleMaps;
  final int? likeCount;
  final String? pdf;

  const CommentProblemEntity({
    this.uid,
    this.profileId,
    this.title,
    this.category,
    this.text,
    this.date,
    this.tags,
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
        title,
        category,
        text,
        date,
        tags,
        photoURL,
        videoURL,
        hasGoogleMaps,
        likeCount,
        pdf,
      ];
}
