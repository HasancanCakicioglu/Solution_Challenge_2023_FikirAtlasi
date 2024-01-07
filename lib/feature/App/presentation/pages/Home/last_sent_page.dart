import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_last_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

class LastSentPageView extends StatefulWidget {
  const LastSentPageView ({super.key});

  @override
  State<LastSentPageView> createState() => _LastSentPageViewState();
}

class _LastSentPageViewState extends State<LastSentPageView> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(future: sl.get<GetCommentProblemListLastUsecase>().call(null), builder: (context,snapshot){

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

      }),
    );
  
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}