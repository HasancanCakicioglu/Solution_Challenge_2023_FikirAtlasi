import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_suggestion_card.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';

@RoutePage()
class CommentSuggestionPageView extends StatefulWidget {
  const CommentSuggestionPageView(
      {super.key, required this.commentSuggestionEntity});
  final CommentSuggestionEntity commentSuggestionEntity;

  @override
  State<CommentSuggestionPageView> createState() =>
      _CommentSuggestionPageViewState();
}

class _CommentSuggestionPageViewState extends State<CommentSuggestionPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CommentsSuggestionCard(
          commentSolutionEntity: widget.commentSuggestionEntity,
          canGo: false,
        ),
      ),
    );
  }
}
