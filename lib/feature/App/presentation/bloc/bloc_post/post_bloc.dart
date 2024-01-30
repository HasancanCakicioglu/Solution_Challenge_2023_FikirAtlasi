import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/create_comment_problem_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/upload_files_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  CreateCommentProblemUsecase createCommentProblemUsecase;
  UploadFilesUsecase uploadFilesUsecase;

  PostBloc(this.createCommentProblemUsecase, this.uploadFilesUsecase)
      : super(const PostState()) {
    on<PostEvent>((event, emit) {});
    on<PostTitleChanged>(_onEmailChanged);
    on<PostContentChanged>(_onPasswordChanged);
    on<PostCategoryChanged>(_onCategoryChanged);
    on<PostSubmitted>(_onSubmitted);
    on<PostMediaAdded>(_onMediaAdded);
    on<PostMediaRemoved>(_onMediaRemoved);
    on<PostTagsChanged>(_onTagsChanged);
    on<PostLocationChanged>(_onLocationChanged);
    on<PostMediaSplitted>(_onMediaSplitted);
  }

  void _onEmailChanged(PostTitleChanged event, Emitter<PostState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onPasswordChanged(PostContentChanged event, Emitter<PostState> emit) {
    emit(state.copyWith(content: event.content));
  }

  void _onCategoryChanged(PostCategoryChanged event, Emitter<PostState> emit) {
    emit(state.copyWith(category: event.category));
  }

  void _onTagsChanged(PostTagsChanged event, Emitter<PostState> emit) {
    emit(state.copyWith(tags: List.of(event.tags)));
  }

  void _onLocationChanged(PostLocationChanged event, Emitter<PostState> emit) {
    emit(state.copyWith(latitude: event.latitude, longitude: event.longitude));
  }

  void _onSubmitted(PostSubmitted event, Emitter<PostState> emit) async {
    await uploadFilesUsecase
        .call(FirestoreAllowedFileTypes.image, state.files)
        .then((value) async {
      List<String> imageFiles = [];
      List<String> videoFiles = [];
      List<String> pdfFiles = [];

      value.forEach((key, fileList) {
        if (key.endsWith('.jpg') ||
            key.endsWith('.png') ||
            key.endsWith('.jpeg')) {
          // Resim dosyası
          imageFiles.addAll(fileList);
        } else if (key.endsWith('.mp4') ||
            key.endsWith('.avi') ||
            key.endsWith('.mov')) {
          // Video dosyası
          videoFiles.addAll(fileList);
        } else if (key.endsWith('.pdf')) {
          // PDF dosyası
          pdfFiles.addAll(fileList);
        }
      });

      emit(state.copyWith(
          images: imageFiles, videos: videoFiles, pdf: pdfFiles));

    });



    CommentProblemEntity commentProblemEntity = CommentProblemEntity(
      title: state.title,
      category: state.category.value.toString(),
      tags: state.tags,
      text: state.content,
      images: state.images,
      videos: state.videos,
      pdf: state.pdf,
      latitude: state.latitude,
      longitude: state.longitude,
    );
    print(commentProblemEntity.toString());
    createCommentProblemUsecase.call(commentProblemEntity);
  }

  // void _onMediaAdded(PostMediaAdded event, Emitter<PostState> emit) {
  //   // Create new lists by adding the elements from the event to the existing state lists
  //   List<String> newVideos = List.from(state.videos)..addAll(event.video);
  //   List<String> newImages = List.from(state.images)..addAll(event.images);
  //   List<String> newPdf = List.from(state.pdf)..addAll(event.pdf);

  //   // Update the state with the new lists
  //   emit(state.copyWith(
  //     videos: newVideos,
  //     images: newImages,
  //     pdf: newPdf,
  //   ));
  // }

  void _onMediaAdded(PostMediaAdded event, Emitter<PostState> emit) {
    emit(state.copyWith(files: List.from(state.files)..addAll(event.files)));
  }

  void _onMediaRemoved(PostMediaRemoved event, Emitter<PostState> emit) {
    if (state.videos.contains(event.media)) {
      emit(state.copyWith(videos: state.videos..remove(event.media)));
    } else if (state.images.contains(event.media)) {
      emit(state.copyWith(images: state.images..remove(event.media)));
    } else if (state.pdf.contains(event.media)) {
      emit(state.copyWith(pdf: state.pdf..remove(event.media)));
    }
  }

  void _onMediaSplitted(PostMediaSplitted event, Emitter<PostState> emit) {
    emit(state.copyWith(
        images: event.images, videos: event.video, pdf: event.pdf));
  }

  void uploadFiles() {}
}
