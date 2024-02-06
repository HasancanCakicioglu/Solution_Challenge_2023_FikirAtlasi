import 'package:file_picker/file_picker.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/file_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bloc_post/post_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Post/mixin/post_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/frame_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/image_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/pdf_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/video_player_widget.dart';

class PostBody extends StatefulWidget {
  const PostBody({super.key, required this.isProblem,required this.commendID});
  final bool isProblem;
  final String? commendID;

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> with PostPageMixin {
  @override
  Widget build(BuildContext context) {
    context
        .read<PostBloc>()
        .add(PostIsProblemChanged(isProblem: widget.isProblem,commentID: widget.commendID));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Post'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: [
                  widget.isProblem
                      ? TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            hintText: 'Title',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            context
                                .read<PostBloc>()
                                .add(PostTitleChanged(title: value));
                          },
                        )
                      : const SizedBox(),
                  SizedBox(height: widget.isProblem ? 16.0 : 0.0),
                  TextFormField(
                    controller: contentController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Content',
                    ),
                    onChanged: (value) {
                      context
                          .read<PostBloc>()
                          .add(PostContentChanged(content: value));
                    },
                  ),
                  const SizedBox(
                    height: Material3Design.mediumPadding,
                  ),
                  widget.isProblem
                      ? TextField(
                          controller: textControllerTags,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            prefixIcon: IconButton(
                                onPressed: () {
                                  addTags();
                                },
                                icon: const Icon(Icons.add)),
                            hintText: 'Tags',
                          ),
                        )
                      : const SizedBox(),
                  widget.isProblem
                      ? BlocBuilder<PostBloc, PostState>(
                          builder: (context, state) {
                          return Wrap(
                            children:
                                context.read<PostBloc>().state.tags.map((tag) {
                              return Chip(
                                label: Text(tag),
                                onDeleted: () {
                                  chips.remove(tag);
                                  context
                                      .read<PostBloc>()
                                      .add(PostTagsChanged(tags: chips));
                                },
                              );
                            }).toList(),
                          );
                        })
                      : const SizedBox(),
                  widget.isProblem ? const Divider() : const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.image),
                        onPressed: () {
                          addMedia(FileType.image);
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          addMedia(FileType.video);
                        },
                        icon: const Icon(Icons.video_call_sharp),
                      ),
                      IconButton(
                        onPressed: () {
                          addMedia(FileType.custom);
                        },
                        icon: const Icon(Icons.picture_as_pdf),
                      ),
                      widget.isProblem
                          ? IconButton(
                              onPressed: () {
                                context.router
                                    .pushNamed(NavigationConstants.GoogleMaps)
                                    .then((value) {
                                  if (value != null) {
                                    location = value as LatLng?;
                                    context.read<PostBloc>().add(
                                        PostLocationChanged(
                                            latitude: location!.latitude,
                                            longitude: location!.longitude));
                                  }
                                });
                              },
                              icon: const Icon(Icons.location_on))
                          : const SizedBox(),
                      const Spacer(),
                      widget.isProblem
                          ? BlocBuilder<PostBloc, PostState>(
                              builder: (context, state) {
                              return DropdownButton<CategoriesEnum>(
                                value: context.read<PostBloc>().state.category,
                                items: CategoriesEnum.values
                                    .map((CategoriesEnum category) {
                                  return DropdownMenuItem<CategoriesEnum>(
                                    value: category,
                                    child: Text(category.value.split('.').last),
                                  );
                                }).toList(),
                                onChanged: (CategoriesEnum? selectedValue) {
                                  if (selectedValue != null) {
                                    context.read<PostBloc>().add(
                                        PostCategoryChanged(
                                            category: selectedValue));
                                  }
                                },
                              );
                            })
                          : const SizedBox(),
                    ],
                  ),
                  const Divider(),
                  BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                    return Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection:
                              Axis.horizontal, // Yatay (sağa doğru) kaydırma
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: state.files.onlyImages
                                .map((file) => FrameWidget(
                                      onPressed: () {
                                        context
                                            .read<PostBloc>()
                                            .add(PostMediaRemoved(media: file));
                                      },
                                      size: const Size(80, 80),
                                      child: FileImageWidget(
                                        imageFile: file,
                                        size: const Size(70, 70),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        state.files.onlyImages.isEmpty
                            ? const SizedBox()
                            : const Divider(),
                      ],
                    );
                  }),
                  BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                    return Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: state.files.onlyVideos
                                .map((file) => FrameWidget(
                                      onPressed: () {
                                        context
                                            .read<PostBloc>()
                                            .add(PostMediaRemoved(media: file));
                                      },
                                      size: const Size(80, 80),
                                      child: FileVideoPlayerWidget(
                                        videoFile: file,
                                        size: const Size(70, 70),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        state.files.onlyVideos.isEmpty
                            ? const SizedBox()
                            : const Divider(),
                      ],
                    );
                  }),
                  BlocBuilder<PostBloc, PostState>(builder: (context, state) {
                    return Column(
                      children: [
                        ...state.files.onlyPdfs
                            .map((file) => FrameWidget(
                                onPressed: () {
                                  context
                                      .read<PostBloc>()
                                      .add(PostMediaRemoved(media: file));
                                },
                                size:
                                    Size(MediaQuery.of(context).size.width, 40),
                                child: PdfWidget(
                                  file: file,
                                )))
                            .toList(),
                        state.files.onlyPdfs.isEmpty
                            ? const SizedBox()
                            : const Divider(),
                      ],
                    );
                  }),
                  widget.isProblem
                      ? BlocBuilder<PostBloc, PostState>(
                          builder: (context, state) {
                          return state.latitude != null
                              ? SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: BlocBuilder<PostBloc, PostState>(
                                      builder: (context, state) {
                                    return GoogleMap(
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                            state.latitude ?? 37.7749,
                                            state.longitude ?? -122.4194),
                                        zoom: 12.0,
                                      ),
                                      markers: {
                                        Marker(
                                          markerId: const MarkerId('1'),
                                          position: LatLng(
                                              state.latitude ?? 37.7749,
                                              state.longitude ?? -122.4194),
                                        )
                                      },
                                    );
                                  }))
                              : const SizedBox();
                        })
                      : const SizedBox(),
                  const SizedBox(height: Material3Design.largePadding),
                  ElevatedButton(
                      onPressed: () {
                        context.read<PostBloc>().add(const PostSubmitted());
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text('Submit'),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
