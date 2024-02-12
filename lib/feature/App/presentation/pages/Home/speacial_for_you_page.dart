import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_specialForYou/home_special_for_you_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/mixin/special_for_you_page_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/floatingActionButton.dart';


/// This page is the special for you page of the application.
/// 
/// It contains the comments of the problems that are recommended for the user.
class SpeacialForYouPageView extends StatefulWidget {
  const SpeacialForYouPageView({Key? key, required this.scrollControllerNested})
      : super(key: key);
  final ScrollController scrollControllerNested;

  @override
  State<SpeacialForYouPageView> createState() => _SpeacialForYouPageViewState();
}

class _SpeacialForYouPageViewState extends State<SpeacialForYouPageView>
    with AutomaticKeepAliveClientMixin, SpeacialForYouPageMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: RefreshIndicator(onRefresh: () async {
        context
            .read<HomeSpecialForYouCubit>()
            .getCommentProblemListLastRefresh();
      }, child: BlocBuilder<HomeSpecialForYouCubit, HomeSpecialForYouState>(
          builder: (context, state) {
        if (state is HomeSpecialForYouLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSpecialForYouLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollControllerSpecialForYouPage,
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
      })),
      floatingActionButton:  FloatingActionButtonWidget(
        heroTag: context.hashCode.toString(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
