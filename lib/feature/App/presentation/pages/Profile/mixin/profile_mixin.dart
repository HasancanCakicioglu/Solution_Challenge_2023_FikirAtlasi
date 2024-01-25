import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/utility/custom_scroll.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile/profile_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Profile/profile_body.dart';

mixin ProfileMixin<T extends StatefulWidget> on State<ProfileBody> {
  late CustomScrollController scrollControllerProfilePage;

  @override
  void initState() {
    super.initState();

    scrollControllerProfilePage = CustomScrollController();
    scrollControllerProfilePage.addListener(
      () {
        if (scrollControllerProfilePage.isMaxExtent()) {
          context.read<ProfileCubit>().getCommentProblemListLast(widget.profileID);
        }
      },
    );
  }

  @override
  void dispose() {
    scrollControllerProfilePage.dispose();
    super.dispose();
  }
}
