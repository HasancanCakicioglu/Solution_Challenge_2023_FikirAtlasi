import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_comment_problem/comment_problem_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Problem/comment_problem_suggest.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

@RoutePage()
class CommentProblemPageView extends StatefulWidget {
  const CommentProblemPageView({super.key, required this.commentProblemEntity});
  final CommentProblemEntity commentProblemEntity;

  @override
  State<CommentProblemPageView> createState() => _CommentProblemPageViewState();
}

class _CommentProblemPageViewState extends State<CommentProblemPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.commentProblemEntity.title!),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: SingleChildScrollView(
                child: CommentsProblemCard(
                  commentProblemEntity: widget.commentProblemEntity,
                  canGo: false,
                ),
              )),
          const Divider(),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(PostPageRoute(
                      isProblem: false,
                      commentID: widget.commentProblemEntity.uid!));
                },
                child: const Text("writesolution").tr()),
          ),
          const Divider(height: 5),
          BlocProvider<CommentProblemCubit>(
              create: (context) => sl.get<CommentProblemCubit>(),
              child: CommnetProblemSuggest(
                  commentProblemEntity: widget.commentProblemEntity)),
        ],
      ),
    );
  }
}
