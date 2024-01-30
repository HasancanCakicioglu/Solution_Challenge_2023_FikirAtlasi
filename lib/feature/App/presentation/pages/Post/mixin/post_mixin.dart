import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bloc_post/post_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Post/post_body.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/select_files_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/upload_files_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

mixin PostPageMixin<T extends StatefulWidget> on State<PostBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late UploadFilesUsecase uploadFilesUsecase;
  late SelectFilesUsecase selectFilesUsecase;
  late CategoriesEnum selectedCategory;
  late final TextEditingController textControllerTags;
  late final List<String> chips;
  late LatLng? location;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
    uploadFilesUsecase = sl.get<UploadFilesUsecase>();
    selectFilesUsecase = sl.get<SelectFilesUsecase>();
    selectedCategory = CategoriesEnum.other;
    textControllerTags = TextEditingController();
    chips = [];
    location = null;
  }

  // void addImage() {
  //   selectFilesUsecase.call().then((value) {
  //     if (value != null && value.isNotEmpty) {
  //       uploadFilesUsecase
  //           .call(FirestoreAllowedFileTypes.image, value)
  //           .then((value) {
  //         List<String> imageFiles = [];
  //         List<String> videoFiles = [];
  //         List<String> pdfFiles = [];

  //         value.forEach((key, fileList) {
  //           if (key.endsWith('.jpg') ||
  //               key.endsWith('.png') ||
  //               key.endsWith('.jpeg')) {
  //             // Resim dosyası
  //             imageFiles.addAll(fileList);
  //           } else if (key.endsWith('.mp4') ||
  //               key.endsWith('.avi') ||
  //               key.endsWith('.mov')) {
  //             // Video dosyası
  //             videoFiles.addAll(fileList);
  //           } else if (key.endsWith('.pdf')) {
  //             // PDF dosyası
  //             pdfFiles.addAll(fileList);
  //           }
  //         });

  //         context.read<PostBloc>().add(PostMediaAdded(
  //             images: imageFiles, video: videoFiles, pdf: pdfFiles));
  //       });
  //     }
  //   });
  // }

  void addImage(){
    selectFilesUsecase.call().then((value) {
      if (value != null && value.isNotEmpty) {
        context.read<PostBloc>().add(PostMediaAdded(files: value));
      }
    });
  }

  void addTags(){
    chips.add(textControllerTags.text);
    context.read<PostBloc>().add(PostTagsChanged(tags: chips));
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
