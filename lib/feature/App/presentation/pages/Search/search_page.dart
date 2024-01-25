import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_search/search_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Search/mixin/search_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/sliver_appbar.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => sl.get<SearchCubit>(),
      child: Builder(
        builder: (context) {
          return NestedScrollView(
              controller: scrollControllerNested,
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBarWidget(text: "Search", action: [
                    InkWell(
                      onTap: () {
                        context
                            .read<SearchCubit>()
                            .getSearchCommentProblemListOnTap(
                                "eğitim önemlidir.");
                      },
                      child: const Icon(Icons.search),
                    )
                  ]),
                ];
              },
              body: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchLoaded) {
                  return ListView.builder(
                    itemCount: state.comments.length,
                    itemBuilder: (context, index) {
                      return CommentsProblemCard(
                        commentProblemEntity: state.comments[index]!,
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("Initial State"),
                  );
                }
              }));
        },
      ),
    ));
  }
}
