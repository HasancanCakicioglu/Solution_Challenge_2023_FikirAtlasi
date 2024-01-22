import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_specialForYou/home_special_for_you_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/mixin/special_for_you_page_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';
import 'package:cloud_functions/cloud_functions.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          HttpsCallable callable =
              FirebaseFunctions.instanceFor(region: 'europe-west3')
                  .httpsCallable(
            'semanticSearch',
            options: HttpsCallableOptions(
              timeout: const Duration(seconds: 5),
            ),
          );

          await callable(<String, dynamic>{"text": "gelen data budur moruk"})
              .then((value) {
            // JSON'u parse et
            Map<String, dynamic> jsonMap = json.decode(value.data);
            

            

           
          }).catchError((error) => print("Firebase Functions hatası: $error"));
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
