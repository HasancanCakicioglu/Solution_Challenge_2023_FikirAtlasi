import 'package:easy_localization/easy_localization.dart';
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

/// [PostBody] is the main widget for the post pages.
///
/// This page view displays a form for creating a new post.
class PostBody extends StatefulWidget {
  const PostBody({Key? key, required this.isProblem, required this.commendID})
      : super(key: key);
  final bool isProblem;
  final String? commendID;

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> with PostPageMixin {
  @override
  Widget build(BuildContext context) {
    _updatePostBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post').tr(),
        centerTitle: true,
      ),
      body: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state.sent) {
            Navigator.pop(context);
            Navigator.pop(context);
          }
          if (state.sending) {
            showDialog(context: context, builder: (context)=> const SimpleDialog(
              children: [
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: _buildFormFields(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _updatePostBloc() {
    context.read<PostBloc>().add(PostIsProblemChanged(
        isProblem: widget.isProblem, commentID: widget.commendID));
  }

  List<Widget> _buildFormFields(BuildContext context) {
    List<Widget> fields = [
      if (widget.isProblem) _buildTitleField(context),
      _buildContentField(context),
      SizedBox(height: widget.isProblem ? 16.0 : 0.0),
      if (widget.isProblem) _buildTagsField(context),
      if (widget.isProblem) _buildChipsField(),
      const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMediaButtons(context),
          const Spacer(),
          _buildCategoryDropdown(context),
        ],
      ),
      _buildImageFrames(context),
      _buildVideoFrames(context),
      _buildPdfFrames(context),
      const SizedBox(height: Material3Design.largePadding),
    ];
    if (widget.isProblem) {
      fields.add(_buildGoogleMap(context));
    }
    fields.add(_buildSubmitButton(context));
    return fields;
  }

  Widget _buildTitleField(BuildContext context) {
    return TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        hintText: 'Title'.tr(),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        context.read<PostBloc>().add(PostTitleChanged(title: value));
      },
    );
  }

  Widget _buildContentField(BuildContext context) {
    return TextFormField(
      controller: contentController,
      maxLines: 10,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Content'.tr(),
      ),
      onChanged: (value) {
        context.read<PostBloc>().add(PostContentChanged(content: value));
      },
    );
  }

  Widget _buildTagsField(BuildContext context) {
    return TextField(
      controller: textControllerTags,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: IconButton(
            onPressed: () {
              addTags();
            },
            icon: const Icon(Icons.add)),
        hintText: 'Tags'.tr(),
      ),
    );
  }

  Widget _buildChipsField() {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return Wrap(
          children: state.tags
              .map((tag) => Chip(
                    label: Text(tag),
                    onDeleted: () {
                      context
                          .read<PostBloc>()
                          .add(PostTagsChanged(tags: state.tags..remove(tag)));
                    },
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _buildMediaButtons(BuildContext context) {
    return Row(
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
        if (widget.isProblem)
          IconButton(
              onPressed: () {
                context.router
                    .pushNamed(NavigationConstants.GoogleMaps)
                    .then((value) {
                  if (value != null) {
                    location = value as LatLng?;
                    context.read<PostBloc>().add(PostLocationChanged(
                        latitude: location!.latitude,
                        longitude: location!.longitude));
                  }
                });
              },
              icon: const Icon(Icons.location_on))
      ],
    );
  }

  Widget _buildCategoryDropdown(BuildContext context) {
    return widget.isProblem
        ? BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            return DropdownButton<CategoriesEnum>(
              value: context.read<PostBloc>().state.category,
              items: CategoriesEnum.values.map((CategoriesEnum category) {
                return DropdownMenuItem<CategoriesEnum>(
                  value: category,
                  child: Text(category.value.split('.').last),
                );
              }).toList(),
              onChanged: (CategoriesEnum? selectedValue) {
                if (selectedValue != null) {
                  context
                      .read<PostBloc>()
                      .add(PostCategoryChanged(category: selectedValue));
                }
              },
            );
          })
        : const SizedBox();
  }

  Widget _buildImageFrames(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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
            if (state.files.onlyImages.isNotEmpty) const Divider(),
          ],
        );
      },
    );
  }

  Widget _buildVideoFrames(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
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
            if (state.files.onlyVideos.isNotEmpty) const Divider(),
          ],
        );
      },
    );
  }

  Widget _buildPdfFrames(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return Column(
          children: [
            ...state.files.onlyPdfs
                .map((file) => FrameWidget(
                    onPressed: () {
                      context
                          .read<PostBloc>()
                          .add(PostMediaRemoved(media: file));
                    },
                    size: Size(MediaQuery.of(context).size.width, 40),
                    child: PdfWidget(
                      file: file,
                    )))
                .toList(),
            if (state.files.onlyPdfs.isNotEmpty) const Divider(),
          ],
        );
      },
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return state.latitude != null
            ? SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(state.latitude ?? 37.7749,
                        state.longitude ?? -122.4194),
                    zoom: 12.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('1'),
                      position: LatLng(state.latitude ?? 37.7749,
                          state.longitude ?? -122.4194),
                    )
                  },
                ))
            : const SizedBox();
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<PostBloc>().add(const PostSubmitted());
      },
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: const Text('Submit').tr(),
        ),
      ),
    );
  }
}
