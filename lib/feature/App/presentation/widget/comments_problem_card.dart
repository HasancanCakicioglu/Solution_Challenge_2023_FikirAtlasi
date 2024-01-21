

import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';

class CommentsProblemCard extends StatelessWidget {
  final CommentProblemEntity commentProblemEntity;

  const CommentsProblemCard({super.key, required this.commentProblemEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 4.0,
          //margin: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(vertical: 100),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: Text(commentProblemEntity.title!),
            subtitle: Text(commentProblemEntity.text!),
            leading: CircleAvatar(
              child: Text(commentProblemEntity.profileId!),
            ),
            trailing: Text(commentProblemEntity.date.toString()),
            onTap: () {
             
             
            },
          ),
        );
  }
}