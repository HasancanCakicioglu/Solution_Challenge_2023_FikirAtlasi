import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_comment_problem/comment_problem_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Problem/mixin/comment_problem_page_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_suggestion_card.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/comments_problems_entites.dart';

class CommnetProblemSuggest extends StatefulWidget {
  const CommnetProblemSuggest({super.key, required this.commentProblemEntity});
  final CommentProblemEntity commentProblemEntity;

  @override
  State<CommnetProblemSuggest> createState() => _CommnetProblemSuggestState();
}

class _CommnetProblemSuggestState extends State<CommnetProblemSuggest>
    with CommentProblemPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentProblemCubit, CommentProblemState>(
        builder: (context, state) {
      if (state is CommentProblemLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is CommentProblemLoaded) {
        return Expanded(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollControllerCommentProblemPage,
                  itemCount: state.comments.length,
                  itemBuilder: (context, index) {
                    return CommentsSuggestionCard(
                      commentSolutionEntity: state.comments[index]!,
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
    });
  }
}
