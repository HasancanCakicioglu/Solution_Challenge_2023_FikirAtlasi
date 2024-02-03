part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostTitleChanged extends PostEvent {
  final String title;

  const PostTitleChanged({required this.title});

  @override
  List<Object> get props => [title];
}

class PostContentChanged extends PostEvent {
  final String content;

  const PostContentChanged({required this.content});

  @override
  List<Object> get props => [content];
}

class PostCategoryChanged extends PostEvent {
  final CategoriesEnum category;

  const PostCategoryChanged({required this.category});

  @override
  List<Object> get props => [category.value];
}

class PostTagsChanged extends PostEvent {
  final List<String> tags;

  const PostTagsChanged({required this.tags});

  @override
  List<Object> get props => [tags.length];
}

class PostLocationChanged extends PostEvent {
  final double latitude;
  final double longitude;

  const PostLocationChanged({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];
}

class PostSubmitted extends PostEvent {


  const PostSubmitted();

  @override
  List<Object> get props => [];
}


class PostMediaSplitted extends PostEvent {
  final List<String> video;
  final List<String> images;
  final List<String> pdf;

  const PostMediaSplitted({required this.video, required this.images, required this.pdf});

  @override
  List<Object> get props => [video, images, pdf];
}

class PostMediaAdded extends PostEvent {
  final List<File> files;


  const PostMediaAdded({required this.files});

  @override
  List<Object> get props => [files.length];
}


class PostMediaRemoved extends PostEvent {
  final File media;

  const PostMediaRemoved({required this.media});

  @override
  List<Object> get props => [media];
}
