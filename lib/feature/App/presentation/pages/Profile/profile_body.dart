import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile/profile_cubit.dart';
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
    return const Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/2838/2838912.png'),
            ),
            Text("tarih"),
            Text("kim olduğu"),
          ],
        ),
        Text('Username'),
      ],
    );
  }
}
