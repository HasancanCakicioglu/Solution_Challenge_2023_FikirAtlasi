

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';

@RoutePage()
class CommentSuggestionPageView extends StatefulWidget {
  const CommentSuggestionPageView({super.key,required this.commentSuggestionEntity});
  final CommentSuggestionEntity commentSuggestionEntity;

  @override
  State<CommentSuggestionPageView> createState() => _CommentSuggestionPageViewState();
}

class _CommentSuggestionPageViewState extends State<CommentSuggestionPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(widget.commentSuggestionEntity.title!),
          Text(widget.commentSuggestionEntity.text!),
          Text(widget.commentSuggestionEntity.profileId!),
          Text(widget.commentSuggestionEntity.date.toString()),
          widget.commentSuggestionEntity.images != null &&
                  widget.commentSuggestionEntity.images!.isNotEmpty
              ? Image.network(widget.commentSuggestionEntity.images![0])
              : Container(),
          widget.commentSuggestionEntity.videos != null &&
                  widget.commentSuggestionEntity.videos!.isNotEmpty
              ? Image.network(widget.commentSuggestionEntity.videos![0])
              : Container(),
          widget.commentSuggestionEntity.pdf != null &&
                  widget.commentSuggestionEntity.pdf!.isNotEmpty
              ? Image.network(widget.commentSuggestionEntity.pdf![0])
              : Container(),
        ],
      ),
    );
  }
}