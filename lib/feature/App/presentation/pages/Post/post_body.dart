import 'dart:io';
import 'package:path/path.dart' as path;
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
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/image_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/pdf_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/video_player_widget.dart';

class PostBody extends StatefulWidget {
  const PostBody({super.key, this.isProblem = true});
  final bool isProblem;

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> with PostPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: context.read<PostBloc>()
          ..state.copyWith(isProblem: widget.isProblem),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
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
                    ),
                    const SizedBox(height: 16.0),
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
                      height: Material3Paddings.mediumPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Icon(Icons.image),
                          onTap: () {
                            addImage();
                          },
                        ),
                        Icon(Icons.video_call),
                        Icon(Icons.picture_as_pdf),
                        IconButton(
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
                            icon: Icon(Icons.location_on)),
                        Spacer(),
                        DropdownButton<CategoriesEnum>(
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
                                  PostCategoryChanged(category: selectedValue));
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: state.files.onlyImages
                          .map((file) => Stack(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: FileImageWidget(
                                      imageFile: file,
                                      size: const Size(80, 80),
                                    ),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          context.read<PostBloc>().add(
                                              PostMediaRemoved(media: file));
                                        },
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black
                                              // Çarpı işareti rengi
                                              ),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors
                                                .white, // Çarpı işareti rengi
                                          ),
                                        ),
                                      )),
                                ],
                              ))
                          .toList(),
                    ),
                    Row(
                      children: state.files.onlyVideos
                          .map(
                            (file) => FileVideoPlayerWidget(
                              videoFile: file,
                              size: const Size(50, 50),
                            ),
                          )
                          .toList(),
                    ),
                    ...state.files.onlyPdfs
                        .map((file) => PdfWidget(
                              file: file,
                            ))
                        .toList(),
                    Wrap(
                      children: context.read<PostBloc>().state.tags.map((tag) {
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
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(state.latitude ?? 37.7749,
                              state.longitude ?? -122.4194), // Örnek bir konum
                          zoom: 12.0,
                        ),
                      ),
                    ),
                    const Divider(),
                    TextField(
                      controller: textControllerTags,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              addTags();
                            },
                            icon: const Icon(Icons.add)),
                        hintText: 'Tags',
                      ),
                    ),
                    Divider(),
                    const Divider(),
                    const Divider(),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                        onPressed: () {
                          context.read<PostBloc>().add(PostSubmitted());
                        },
                        child: Text('Submit')),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildFileWidgets(PostState state) {
    List<Widget> widgets = [];

    for (File file in state.files) {
      FirestoreAllowedFileTypes fileType = file.fileType;

      if (fileType == FirestoreAllowedFileTypes.image) {
        widgets.add(_buildImageWidget(file));
      } else if (fileType == FirestoreAllowedFileTypes.video) {
        widgets.add(_buildVideoWidget(file));
      } else if (fileType == FirestoreAllowedFileTypes.pdf) {
        widgets.add(_buildPdfWidget(file));
      } else {
        // Belirlenemeyen tür için bir şey yapabilirsiniz (şu anda boş bir container ekliyoruz)
        widgets.add(Container());
      }
    }

    return widgets;
  }

  Widget _buildImageWidget(File file) {
    return Row(
      children: [
        Image.file(file, width: 50, height: 50, fit: BoxFit.cover),
        const SizedBox(width: 8.0),
      ],
    );
  }

  Widget _buildVideoWidget(File file) {
    return Row(
      children: [
        Image.file(file, width: 50, height: 50, fit: BoxFit.cover),
        const SizedBox(width: 8.0),
        Icon(Icons.play_arrow),
        const SizedBox(width: 8.0),
      ],
    );
  }

  Widget _buildPdfWidget(File file) {
    return Column(
      children: [
        Text('PDF: ${path.basename(file.path)}'),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
