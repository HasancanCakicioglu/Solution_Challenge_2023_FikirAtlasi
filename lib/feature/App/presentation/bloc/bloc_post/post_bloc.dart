import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/create_comment_problem_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/create_comment_suggestion_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/upload_files_usecase.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Services/domain/usecases/get_geo_fire_point_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  CreateCommentProblemUsecase createCommentProblemUsecase;
  CreateCommentSuggestionUsecase createCommentSuggestionUsecase;
  UploadFilesUsecase uploadFilesUsecase;
  GetGeoFirePointUsecase getGeoFirePointUsecase;

  PostBloc(this.createCommentProblemUsecase, this.uploadFilesUsecase,
      this.getGeoFirePointUsecase, this.createCommentSuggestionUsecase)
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
    on<PostIsProblemChanged>(_onIsProblemChanged);
    on<PostProblemSendingChange>(_onSendingChanged);
    on<PostProblemSentChange>(_onSentChanged);
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

  void _onSendingChanged(
      PostProblemSendingChange event, Emitter<PostState> emit) {
    emit(state.copyWith(sending: event.sending));
  }

  void _onSentChanged(PostProblemSentChange event, Emitter<PostState> emit) {
    emit(state.copyWith(sent: event.sent));
  }

  void _onSubmitted(PostSubmitted event, Emitter<PostState> emit) async {
    emit(state.copyWith(sending: true));
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

    GeoFirePoint? geoFirePoint;

    if (state.latitude != null && state.longitude != null) {
      geoFirePoint =
          getGeoFirePointUsecase.call(state.latitude!, state.longitude!);
    }

    if (state.isProblem) {
      CommentProblemEntity commentProblemEntity = CommentProblemEntity(
          title: state.title,
          category: state.category.value.toString(),
          tags: state.tags,
          text: state.content,
          images: state.images,
          videos: state.videos,
          pdf: state.pdf,
          geoFirePoint: geoFirePoint?.data);
      await createCommentProblemUsecase.call(commentProblemEntity).then((value) async{
        emit(state.copyWith(sending: false, sent: true));
      });
    } else {
      CommentSuggestionEntity commentSuggestionEntity = CommentSuggestionEntity(
          text: state.content,
          commentProblemID: state.commentID,
          images: state.images,
          videos: state.videos,
          pdf: state.pdf);
      await createCommentSuggestionUsecase
          .call(commentSuggestionEntity)
          .then((value) async{
        emit(state.copyWith(sending: false, sent: true));
      });
    }
  }

  void _onMediaAdded(PostMediaAdded event, Emitter<PostState> emit) {
    emit(state.copyWith(files: List.from(state.files)..addAll(event.files)));
  }

  void _onMediaRemoved(PostMediaRemoved event, Emitter<PostState> emit) {
    if (state.files.contains(event.media)) {
      emit(state.copyWith(files: List.from(state.files)..remove(event.media)));
    }
  }

  void _onMediaSplitted(PostMediaSplitted event, Emitter<PostState> emit) {
    emit(state.copyWith(
        images: event.images, videos: event.video, pdf: event.pdf));
  }

  void _onIsProblemChanged(
      PostIsProblemChanged event, Emitter<PostState> emit) {
    emit(
        state.copyWith(isProblem: event.isProblem, commentID: event.commentID));
  }
}
