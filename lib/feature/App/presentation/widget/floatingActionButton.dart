// ignore_for_file: file_names

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/navigation/navigation_constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key,required this.heroTag});
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        child: const Icon(Icons.edit),
        onPressed: () async {
          context.router.pushNamed(NavigationConstants.Post);
        },
      );
  }
}