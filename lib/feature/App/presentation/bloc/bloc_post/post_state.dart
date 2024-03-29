part of 'post_bloc.dart';

class PostState extends Equatable {
  const PostState(
      {this.title = "",
      this.content = "",
      this.videos = const [],
      this.images = const [],
      this.pdf = const [],
      this.category = CategoriesEnum.other,
      this.tags = const [],
      this.latitude,
      this.longitude,
      this.files = const [],
      this.isProblem = true,
      this.commentID,
      this.sending = false,
      this.sent = false});
  final String title;
  final String content;
  final List<String> videos;
  final List<String> images;
  final List<String> pdf;
  final CategoriesEnum category;
  final List<String> tags;
  final double? latitude;
  final double? longitude;
  final List<File> files;
  final bool isProblem;
  final String? commentID;

  final bool sending;
  final bool sent;

  PostState copyWith(
      {String? title,
      String? content,
      List<String>? videos,
      List<String>? images,
      List<String>? pdf,
      CategoriesEnum? category,
      List<String>? tags,
      double? latitude,
      double? longitude,
      List<File>? files,
      bool? isProblem,
      String? commentID,
      bool? sending,
      bool? sent}) {
    return PostState(
      title: title ?? this.title,
      content: content ?? this.content,
      videos: videos ?? this.videos,
      images: images ?? this.images,
      pdf: pdf ?? this.pdf,
      category: category ?? this.category,
      tags: tags ?? this.tags,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      files: files ?? this.files,
      isProblem: isProblem ?? this.isProblem,
      commentID: commentID ?? this.commentID,
      sending: sending ?? this.sending,
      sent: sent ?? this.sent,
    );
  }

  @override
  List<Object?> get props => [
        title,
        content,
        videos.length,
        images.length,
        pdf.length,
        category.value,
        tags.length,
        latitude,
        longitude,
        files.length.hashCode,
        isProblem,
        commentID,
        sending,
        sent
      ];

  @override
  String toString() {
    return 'PostState{title: $title, content: $content, videos: $videos, images: $images, pdf: $pdf , category: $category} , tags: $tags , latitude: $latitude , longitude: $longitude , files: $files , isProblem: $isProblem , commentID: $commentID}';
  }
}
