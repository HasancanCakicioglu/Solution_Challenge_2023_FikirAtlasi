import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/context_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/time_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/pdf_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/video_player_widget.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';


class CommentsProblemCard extends StatelessWidget {
  final CommentProblemEntity commentProblemEntity;

  const CommentsProblemCard({super.key, required this.commentProblemEntity});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(CommentProblemPageRoute(
            commentProblemEntity: commentProblemEntity));
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: commentProblemEntity.profileImage != null
                      ? NetworkImage(commentProblemEntity.profileImage!)
                      : null,
                  backgroundColor: commentProblemEntity.profileImage != null
                      ? Colors.transparent
                      : Colors
                          .grey, // Eğer görüntü yoksa gri arkaplan rengi ekleyin
                  child: commentProblemEntity.profileImage == null
                      ? Icon(Icons.person,
                          color: isDark
                              ? Colors.white
                              : Colors.black) // Görüntü yoksa ikon ekleyin
                      : null,
                ).padded(
                    const EdgeInsets.only(right: Material3Design.largePadding)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commentProblemEntity.profileName ?? "Anonymous",
                      style: Material3Design.mediumText,
                    ),
                    Text(
                      commentProblemEntity.date!.timeAgoString(),
                      style: Material3Design.smallText,
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.stars_rounded,
                      size: 40,
                    ))
              ],
            ).padded(
                const EdgeInsets.only(bottom: Material3Design.largePadding)),
            Text(
              commentProblemEntity.text ?? "No Comment",
              style: Material3Design.mediumText,
            ).padded(
                const EdgeInsets.only(bottom: Material3Design.largePadding)),
            (commentProblemEntity.images != null &&
                    commentProblemEntity.images!.isNotEmpty)
                ? SizedBox(
                    height:
                        200, // İstediğiniz boyutu buradan ayarlayabilirsiniz
                    child: ListView.builder(
                      scrollDirection: Axis
                          .horizontal, // Dikey göstermek istiyorsanız Axis.vertical kullanabilirsiniz
                      itemCount: commentProblemEntity.images!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right:
                                  8.0), // İstenilen aralığı ayarlayabilirsiniz
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              fit: BoxFit.cover,
                              commentProblemEntity.images![index],
                              filterQuality: FilterQuality.low,
                              loadingBuilder: (context, widget, imageChunk) {
                                return imageChunk == null
                                    ? widget
                                    : const CircularProgressIndicator();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
            const SizedBox(
              height: Material3Design.largePadding,
            ),

            // Eğer video varsa göster
            (commentProblemEntity.videos != null &&
                    commentProblemEntity.videos!.isNotEmpty)
                ? SizedBox(
                  height: 0,
                    child: ListView.builder(
                      scrollDirection: Axis
                          .horizontal, // Dikey göstermek istiyorsanız Axis.vertical kullanabilirsiniz
                      itemCount: commentProblemEntity.videos!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right:
                                  8.0), // İstenilen aralığı ayarlayabilirsiniz
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox(),
            (commentProblemEntity.videos != null &&
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
                              videoFile:
                                  File(commentProblemEntity.videos![index]),
                              isFile: false,
                              size: Size(MediaQuery.of(context).size.width * 0.85, 100),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),

            ...commentProblemEntity.pdf?.map((e) => PdfWidget(file: File(e))) ??
                [],
          ],
        ).padded(const EdgeInsets.all(Material3Design.largePadding)),
      ).padded(const EdgeInsets.all(Material3Design.mediumPadding)),
    );
  }
}
