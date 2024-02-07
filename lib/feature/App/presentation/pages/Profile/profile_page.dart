import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile/profile_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Profile/profile_body.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

@RoutePage()
class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key, required this.profileID});
  final String profileID;

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl.get<ProfileCubit>()
          ..getCommentProblemListLastRefresh(widget.profileID),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Profile").tr(),
          ),
          body: ProfileBody(profileID: widget.profileID,),
        ));
  }
}
