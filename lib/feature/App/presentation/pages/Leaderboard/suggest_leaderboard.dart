import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_suggestion_card.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_suggest_list_according_to_likecount_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

class SuggestLeaderBoardPageView extends StatefulWidget {
  const SuggestLeaderBoardPageView({super.key});

  @override
  State<SuggestLeaderBoardPageView> createState() => _SuggestLeaderBoardPageViewState();
}

class _SuggestLeaderBoardPageViewState extends State<SuggestLeaderBoardPageView> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(future: sl.get<GetCommentSuggestionListAccordingToLikeCountUseCase>().call(null), builder: (context,snapshot){

        return snapshot.hasData ? snapshot.data!.fold((l) => Center(child: Text("Error ${l.message}"),), (r) {
          return ListView.builder(
            itemCount: r.value1.length,
            itemBuilder: (context, index) {
              return CommentsSuggestionCard(
                commentSuggestionEntity: r.value1[index]!,
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