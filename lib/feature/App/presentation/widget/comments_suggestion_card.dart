import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_suggestions_entities.dart';

class CommentsSuggestionCard extends StatelessWidget {
  final CommentSuggestionEntity commentSuggestionEntity;

  const CommentsSuggestionCard(
      {super.key, required this.commentSuggestionEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(commentSuggestionEntity.title!),
        subtitle: Text(commentSuggestionEntity.text!),
        leading: CircleAvatar(
          child: Text(commentSuggestionEntity.profileId!),
        ),
        trailing: Text(commentSuggestionEntity.date.toString()),
        onTap: () {},
      ),
    );
  }
}
