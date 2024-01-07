import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_likecount_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

class ProblemLeaderBoardPageView extends StatefulWidget {
  const ProblemLeaderBoardPageView({super.key});

  @override
  State<ProblemLeaderBoardPageView> createState() => _ProblemLeaderBoardPageViewState();
}

class _ProblemLeaderBoardPageViewState extends State<ProblemLeaderBoardPageView> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(future: sl.get<GetCommentProblemListAccordingToLikeCountUseCase>().call(null), builder: (context,snapshot){

        return snapshot.hasData ? snapshot.data!.fold((l) => Center(child: Text("Error ${l.message}"),), (r) {
          return ListView.builder(
            itemCount: r.value1.length,
            itemBuilder: (context, index) {
              return CommentsProblemCard(
                commentProblemEntity: r.value1[index]!,
              );
            },
          );
        }) : const Center(child: CircularProgressIndicator(),);

      },),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}