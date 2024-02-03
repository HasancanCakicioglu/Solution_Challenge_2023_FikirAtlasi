import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_comment_problem/comment_problem_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Problem/comment_problem_suggest.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

@RoutePage()
class CommentProblemPageView extends StatefulWidget {
  const CommentProblemPageView({super.key, required this.commentProblemEntity});
  final CommentProblemEntity commentProblemEntity;

  @override
  State<CommentProblemPageView> createState() => _CommentProblemPageViewState();
}

class _CommentProblemPageViewState extends State<CommentProblemPageView>
     {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.commentProblemEntity.title!),
      ),
      body: Column(
        children: [
          Text(widget.commentProblemEntity.title!),
          Text(widget.commentProblemEntity.text!),
          Text(widget.commentProblemEntity.profileId!),
          Text(widget.commentProblemEntity.date.toString()),
          widget.commentProblemEntity.images != null &&
                  widget.commentProblemEntity.images!.isNotEmpty
              ? Image.network(widget.commentProblemEntity.images![0])
              : Container(),
          widget.commentProblemEntity.videos != null &&
                  widget.commentProblemEntity.videos!.isNotEmpty
              ? Image.network(widget.commentProblemEntity.videos![0])
              : Container(),
          widget.commentProblemEntity.pdf != null &&
                  widget.commentProblemEntity.pdf!.isNotEmpty
              ? Image.network(widget.commentProblemEntity.pdf![0])
              : Container(),
          const Divider(),
          const Center(
            child: Text("Çözüm yaz"),
          ),
          const Divider(height: 5),
          BlocProvider<CommentProblemCubit>(
              create: (context) => sl.get<CommentProblemCubit>(),
              child: CommnetProblemSuggest(problemID:widget.commentProblemEntity.uid!)),
        ],
      ),
    );
  }
}
