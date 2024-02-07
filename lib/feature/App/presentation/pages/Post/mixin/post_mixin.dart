import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bloc_post/post_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Post/post_body.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/select_files_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/upload_files_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

/// This mixin is used to share the same methods and properties between the
///
/// [PostPage] and [EditPostPage] classes.
/// It contains the methods and properties that are used to add media, add tags, and
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

  void addMedia(FileType fileType) async {
    selectFilesUsecase.call(fileType).then((value) {
      if (value != null && value.isNotEmpty) {
        context.read<PostBloc>().add(PostMediaAdded(files: value));
      }
    });
  }

  void addTags() {
    if (textControllerTags.text.isNotEmpty) {
      chips.add(textControllerTags.text);
      textControllerTags.clear();
      context.read<PostBloc>().add(PostTagsChanged(tags: chips));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
