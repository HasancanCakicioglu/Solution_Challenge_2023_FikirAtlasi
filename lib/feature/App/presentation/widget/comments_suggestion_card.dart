import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/context_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/time_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile_entity/profile_entity_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/solutionCardCubit/solution_card_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/network_image_hero.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/pdf_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/video_player_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

/// A widget representing the card for displaying comments on a Solution.
class CommentsSuggestionCard extends StatelessWidget {
  final CommentSuggestionEntity commentSolutionEntity;
  final bool canGo;

  const CommentsSuggestionCard(
      {super.key, required this.commentSolutionEntity, this.canGo = true});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final profileEntity = context.read<ProfileEntityCubit>();

    return BlocProvider<SolutionCardCubit>(
      create: (context) => sl.get<SolutionCardCubit>()
        ..setLike(profileEntity.state.solutionIDs
                ?.contains(commentSolutionEntity.uid) ??
            false),
      child: InkWell(
        onTap: () {
          if (canGo) {
            AutoRouter.of(context).push(CommentSuggestionPageRoute(
                commentSuggestionEntity: commentSolutionEntity));
          }
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfo(context, isDark),
              _buildTextContent(),
              _buildImagesSection(),
              _buildVideosSection(),
              ..._buildPdfWidgets(),
              const Divider(),
              _buildActionButtons(context),
            ],
          ).padded(const EdgeInsets.all(Material3Design.largePadding)),
        ).padded(const EdgeInsets.all(Material3Design.mediumPadding)),
      ),
    );
  }

  /// Builds the user information section of the card.
  Widget _buildUserInfo(BuildContext context, bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildAvatar(),
        _buildProfileInfo(context),
        const Spacer(),
        _buildLikeButton(),
      ],
    ).padded(const EdgeInsets.only(bottom: Material3Design.largePadding));
  }

  /// Builds the avatar section of the card.
  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 30,
      backgroundImage: commentSolutionEntity.profileImage != null
          ? NetworkImage(commentSolutionEntity.profileImage!)
          : null,
      backgroundColor: commentSolutionEntity.profileImage != null
          ? Colors.transparent
          : Colors.grey,
      child: commentSolutionEntity.profileImage == null
          ? const Icon(Icons.person)
          : null,
    ).padded(const EdgeInsets.only(right: Material3Design.largePadding));
  }

  /// Builds the profile information section of the card.
  Widget _buildProfileInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          commentSolutionEntity.profileName ?? "Anonymous".tr(),
          style: Material3Design.mediumText,
        ),
        Text(
          commentSolutionEntity.date!.timeAgoString(),
          style: Material3Design.smallText,
        ),
      ],
    );
  }

  /// Builds the like button section of the card.
  Widget _buildLikeButton() {
    return BlocBuilder<SolutionCardCubit, SolutionCardState>(
        builder: (context, state) {
      return IconButton(
          onPressed: () {
            context.read<SolutionCardCubit>()
              ..likeComment(commentSolutionEntity.uid!, !state.liked)
              ..setLike(!state.liked);
          },
          icon: Icon(
            state.liked ? Icons.favorite : Icons.favorite_border,
            color: state.liked ? Colors.red : null,
            size: 40,
          ));
    });
  }

  /// Builds the text content section of the card.
  Widget _buildTextContent() {
    return BlocBuilder<SolutionCardCubit, SolutionCardState>(
        buildWhen: (previous, current) =>
            previous.translationText != current.translationText,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                commentSolutionEntity.text ?? "nocomment".tr(),
                style: Material3Design.mediumText,
              ).padded(
                  const EdgeInsets.only(bottom: Material3Design.largePadding)),
              state.translationText == null
                  ? TextButton(
                      onPressed: () {
                        context
                            .read<SolutionCardCubit>()
                            .translateText(commentSolutionEntity.text ?? "");
                      },
                      child: const Text("Yazıyı türkçeye çevir"),
                    ).padded(const EdgeInsets.only(
                      bottom: Material3Design.largePadding))
                  : const SizedBox(),
              state.translationText != null
                  ? RichText(
                      text: const TextSpan(
                        text: 'Bu Metin ',
                        style: TextStyle(
                            color: Colors
                                .grey), // Başlangıç rengi, varsayılan olarak siyah
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Google',
                            style: TextStyle(
                              color: Colors
                                  .red, // Google kelimesinin rengi kırmızı
                              fontWeight: FontWeight.bold, // Kalın yazı stili
                              fontStyle: FontStyle.italic, // İtalik yazı stili
                            ),
                          ),
                          TextSpan(
                            text: ' Trafından Çevrilmiştir',
                            style: TextStyle(
                                color: Colors
                                    .grey), // Geri kalan metin siyah renkte
                          ),
                        ],
                      ),
                    ).padded(const EdgeInsets.only(
                      bottom: Material3Design.largePadding))
                  : const SizedBox(),
              state.translationText != null
                  ? Text(state.translationText!).padded(const EdgeInsets.only(
                      bottom: Material3Design.largePadding))
                  : const SizedBox(),
            ],
          );
        });
  }

  /// Builds the images section of the card.
  Widget _buildImagesSection() {
    return (commentSolutionEntity.images != null &&
            commentSolutionEntity.images!.isNotEmpty)
        ? SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: commentSolutionEntity.images!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NetworkImageHero(
                            image: commentSolutionEntity.images![index],
                            tag: commentSolutionEntity.images![index] +
                                commentSolutionEntity.uid! +
                                index.toString(),
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: commentSolutionEntity.images![index] +
                          commentSolutionEntity.uid! +
                          index.toString(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          commentSolutionEntity.images![index],
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.low,
                          loadingBuilder: (context, widget, imageChunk) {
                            return imageChunk == null
                                ? widget
                                : const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : Container();
  }

  /// Builds the videos section of the card.
  Widget _buildVideosSection() {
    return (commentSolutionEntity.videos != null &&
            commentSolutionEntity.videos!.isNotEmpty)
        ? SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: commentSolutionEntity.videos!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FileVideoPlayerWidget(
                      videoFile: File(commentSolutionEntity.videos![index]),
                      isFile: false,
                      size: Size(MediaQuery.of(context).size.width * 0.85, 100),
                    ),
                  ),
                );
              },
            ),
          )
        : Container();
  }

  /// Builds the PDF widgets section of the card.
  List<Widget> _buildPdfWidgets() {
    return commentSolutionEntity.pdf
            ?.map((e) => PdfWidget(file: File(e)))
            .toList() ??
        [];
  }

  /// Builds the action buttons section of the card.
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLikeCount(context),
        const Icon(Icons.share),
      ],
    );
  }

  /// Builds the like count section of the card.
  Widget _buildLikeCount(BuildContext context) {
    return BlocBuilder<SolutionCardCubit, SolutionCardState>(
        builder: (context, state) {
      return Row(
        children: [
          Icon(state.liked ? Icons.favorite : Icons.favorite_border,
              color: state.liked ? Colors.red : null),
          const SizedBox(
            width: Material3Design.mediumPadding,
          ),
          Text(
              "${(commentSolutionEntity.likeCount ?? 0) + (state.liked ? 1 : 0)}"),
        ],
      );
    });
  }
}
