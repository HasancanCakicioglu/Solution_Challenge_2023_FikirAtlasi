import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/time_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile/profile_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile_entity/profile_entity_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Profile/mixin/profile_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key, required this.profileID});
  final String profileID;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> with ProfileMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        profileCard(),
        const Divider(),
        BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollControllerProfilePage,
                      itemCount: state.comments.length,
                      itemBuilder: (context, index) {
                        return CommentsProblemCard(
                          commentProblemEntity: state.comments[index]!,
                        );
                      },
                    ),
                  ),
                  if (state.isLoadingNewData)
                    const Center(child: CircularProgressIndicator()),
                  //if(state.isError) const Center(child: Icon(Icons.error)),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Initial state'));
          }
        })
      ],
    );
  }

  Widget profileCard() {
    final state = context.read<ProfileEntityCubit>().state;
    final user = FirebaseAuth.instance.currentUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  NetworkImage(state.profileUrl ?? user?.photoURL ?? ""),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(state.name ?? user?.displayName ?? ""),
                Text(state.dateOfJoin ??
                    user?.metadata.creationTime?.timeAgo() ??
                    DateTime.now().timeAgo()),
              ],
            ).padded(
                const EdgeInsets.only(left: Material3Design.largePadding * 2)),
          ],
        ),
        const SizedBox(
          height: Material3Design.largePadding,
        ),
        Text(state.describeYourself ??
            "aboutyourself".tr()),
      ],
    ).padded(const EdgeInsets.all(Material3Design.largePagePadding));
  }
}
