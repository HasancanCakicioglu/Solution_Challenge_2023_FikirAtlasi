
import 'package:equatable/equatable.dart';

class CommentProblemEntity extends Equatable {
  final String? uid;
  final String? profileId;
  final String? title;
  final String? category;
  final String? text;
  final String? date;
  final List<String>? tags;
  final double? latitude;
  final double? longitude;
  final int? likeCount;

  final List<String>? pdf;
  final List<String>? images;
  final List<String>? videos;



  const CommentProblemEntity( {
    this.uid,
    this.profileId,
    this.title,
    this.category,
    this.text,
    this.date,
    this.tags,
    this.longitude,
    this.latitude,
    this.likeCount,
    this.pdf,
    this.images,
    this.videos,
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
        latitude,
        longitude,
        likeCount,
        pdf,
        images,
        videos,
      ];

  CommentProblemEntity copyWith({
    String? uid,
    String? profileId,
    String? title,
    String? category,
    String? text,
    String? date,
    List<String>? tags,
    double? latitude,
    double? longitude,
    int? likeCount,
    List<String>? pdf,
    List<String>? images,
    List<String>? videos,
  }) {
    return CommentProblemEntity(
      uid: uid ?? this.uid,
      profileId: profileId ?? this.profileId,
      title: title ?? this.title,
      category: category ?? this.category,
      text: text ?? this.text,
      date: date ?? this.date,
      tags: tags ?? this.tags,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      likeCount: likeCount ?? this.likeCount,
      pdf: pdf ?? this.pdf,
      images: images ?? this.images,
      videos: videos ?? this.videos,
    );
  }
}
