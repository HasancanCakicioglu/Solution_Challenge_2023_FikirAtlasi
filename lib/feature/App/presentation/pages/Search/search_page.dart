import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bloc_search/search_bloc.dart';
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
        body: BlocProvider<SearchBloc>(
      create: (context) => sl.get<SearchBloc>(),
      child: Builder(
        builder: (context) {
          return NestedScrollView(
              controller: scrollControllerNested,
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBarWidget(text: "", action: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextField(
                        onChanged: (value) {
                          context
                              .read<SearchBloc>()
                              .add(SearchTextChanged(text: value));
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...'.tr(),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              context
                                  .read<SearchBloc>()
                                  .add(const SearchSubmitted());
                            },
                          ),
                        ),
                      ).paddedSymmetric(
                          horizontal: Material3Design.largePadding,
                          vertical: Material3Design.smallPadding),
                    ),
                  ]),
                ];
              },
              body: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                if (state.isLoadingNewData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (!state.isLoadingNewData && !state.isError) {
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
                    child: SizedBox(),
                  );
                }
              }));
        },
      ),
    ));
  }
}
