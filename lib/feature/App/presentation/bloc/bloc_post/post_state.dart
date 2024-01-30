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
      this.files=const []});
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
      List<File>? files}) {
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
        files
      ];

  @override
  String toString() {
    return 'PostState{title: $title, content: $content, videos: $videos, images: $images, pdf: $pdf , category: $category} , tags: $tags , latitude: $latitude , longitude: $longitude , files: $files';
  }
}
