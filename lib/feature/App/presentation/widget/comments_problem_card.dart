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
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/problemCardCubit/problem_card_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/network_image_hero.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/pdf_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/video_player_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

/// A widget representing the card for displaying comments on a problem.
class CommentsProblemCard extends StatelessWidget {
  final CommentProblemEntity commentProblemEntity;

  const CommentsProblemCard({super.key, required this.commentProblemEntity});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final profileEntity = context.read<ProfileEntityCubit>();

    return BlocProvider<ProblemCardCubit>(
      create: (context) => sl.get<ProblemCardCubit>()
        ..setLike(profileEntity.state.problemIDs
                ?.contains(commentProblemEntity.uid) ??
            false),
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(CommentProblemPageRoute(
              commentProblemEntity: commentProblemEntity));
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
      backgroundImage: commentProblemEntity.profileImage != null
          ? NetworkImage(commentProblemEntity.profileImage!)
          : null,
      backgroundColor: commentProblemEntity.profileImage != null
          ? Colors.transparent
          : Colors.grey,
      child: commentProblemEntity.profileImage == null
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
          commentProblemEntity.profileName ?? "Anonymous".tr(),
          style: Material3Design.mediumText,
        ),
        Text(
          commentProblemEntity.date!.timeAgoString(),
          style: Material3Design.smallText,
        ),
      ],
    );
  }

  /// Builds the like button section of the card.
  Widget _buildLikeButton() {
    return BlocBuilder<ProblemCardCubit, ProblemCardState>(
        builder: (context, state) {
      return IconButton(
          onPressed: () {
            context.read<ProblemCardCubit>()
              ..likeComment(commentProblemEntity.uid!, !state.liked)
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
    return BlocBuilder<ProblemCardCubit, ProblemCardState>(
      buildWhen: (previous, current) => previous.translation != current.translation,
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commentProblemEntity.text ?? "nocomment".tr(),
            style: Material3Design.mediumText,
          ).padded(const EdgeInsets.only(bottom: Material3Design.largePadding)),
          state.translation == null
              ? TextButton(
                  onPressed: () {
                    context
                        .read<ProblemCardCubit>()
                        .translateText(commentProblemEntity.text!);
                  },
                  child: const Text("Yazıyı türkçeye çevir"),
                ).padded(
                  const EdgeInsets.only(bottom: Material3Design.largePadding))
              : const SizedBox(),
          state.translation != null
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
                          color: Colors.red, // Google kelimesinin rengi kırmızı
                          fontWeight: FontWeight.bold, // Kalın yazı stili
                          fontStyle: FontStyle.italic, // İtalik yazı stili
                        ),
                      ),
                      TextSpan(
                        text: ' Trafından Çevrilmiştir',
                        style: TextStyle(
                            color:
                                Colors.grey), // Geri kalan metin siyah renkte
                      ),
                    ],
                  ),
                ).padded(
                  const EdgeInsets.only(bottom: Material3Design.largePadding))
              : const SizedBox(),
          state.translation != null
              ? Text(state.translation!).padded(
                  const EdgeInsets.only(bottom: Material3Design.largePadding))
              : const SizedBox(),
        ],
      );
    });
  }

  /// Builds the images section of the card.
  Widget _buildImagesSection() {
    return (commentProblemEntity.images != null &&
            commentProblemEntity.images!.isNotEmpty)
        ? SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: commentProblemEntity.images!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NetworkImageHero(
                            image: commentProblemEntity.images![index],
                            tag: commentProblemEntity.images![index] +
                                commentProblemEntity.uid! +
                                index.toString(),
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: commentProblemEntity.images![index] +
                          commentProblemEntity.uid! +
                          index.toString(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          commentProblemEntity.images![index],
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
    return (commentProblemEntity.videos != null &&
            commentProblemEntity.videos!.isNotEmpty)
        ? SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: commentProblemEntity.videos!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FileVideoPlayerWidget(
                      videoFile: File(commentProblemEntity.videos![index]),
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
    return commentProblemEntity.pdf
            ?.map((e) => PdfWidget(file: File(e)))
            .toList() ??
        [];
  }

  /// Builds the action buttons section of the card.
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCommentButton(),
        _buildLikeCount(context),
        const Icon(Icons.share),
      ],
    );
  }

  /// Builds the comment button section of the card.
  Widget _buildCommentButton() {
    return Row(
      children: [
        const Icon(Icons.comment),
        const SizedBox(
          width: Material3Design.mediumPadding,
        ),
        Text("${commentProblemEntity.solutionCount ?? 0}"),
      ],
    );
  }

  /// Builds the like count section of the card.
  Widget _buildLikeCount(BuildContext context) {
    return BlocBuilder<ProblemCardCubit, ProblemCardState>(
        builder: (context, state) {
      return Row(
        children: [
          Icon(state.liked ? Icons.favorite : Icons.favorite_border,
              color: state.liked ? Colors.red : null),
          const SizedBox(
            width: Material3Design.mediumPadding,
          ),
          Text(
              "${(commentProblemEntity.likeCount ?? 0) + (state.liked ? 1 : 0)}"),
        ],
      );
    });
  }
}
