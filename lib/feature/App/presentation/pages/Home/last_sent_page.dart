import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_lastSent/home_last_sent_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/mixin/last_sent_page_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';

class LastSentPageView extends StatefulWidget {
  const LastSentPageView({super.key, required this.scrollControllerNested});
  final ScrollController scrollControllerNested;

  @override
  State<LastSentPageView> createState() => _LastSentPageViewState();
}

class _LastSentPageViewState extends State<LastSentPageView>
    with AutomaticKeepAliveClientMixin, LastSentPageMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeLastSentCubit>().getCommentProblemListLastRefresh();
        },
        child: BlocBuilder<HomeLastSentCubit, HomeLastSentState>(
          builder: (context, state) {
            if (state is HomeLastSentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLastSentLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scrollControllerLastSentPage,
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
              );
            } else {
              return const Center(child: Text('Initial state'));
            }
          },
        ),
      ),
      floatingActionButton:
          FloatingActionButton(heroTag: "btn2", onPressed: () {
            
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
