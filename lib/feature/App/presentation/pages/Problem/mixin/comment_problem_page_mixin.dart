import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/utility/custom_scroll.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_comment_problem/comment_problem_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Problem/comment_problem_suggest.dart';

mixin CommentProblemPageMixin<T extends StatefulWidget> on State<CommnetProblemSuggest> {
  late CustomScrollController scrollControllerCommentProblemPage;

  @override
  void initState() {
    super.initState();
    context.read<CommentProblemCubit>().getCommentProblemListLastRefresh(widget.commentProblemEntity.uid!);
    scrollControllerCommentProblemPage = CustomScrollController();
    scrollControllerCommentProblemPage.addListener(() {
      if (scrollControllerCommentProblemPage.position.pixels ==
          scrollControllerCommentProblemPage.position.maxScrollExtent) {
        context.read<CommentProblemCubit>().getCommentProblemListLast(widget.commentProblemEntity.uid!);
      }
    });
    context.read<CommentProblemCubit>().profileLastLookedContents(widget.commentProblemEntity);

  }

  @override
  void dispose() {
    scrollControllerCommentProblemPage.dispose();
    super.dispose();
  }
}
