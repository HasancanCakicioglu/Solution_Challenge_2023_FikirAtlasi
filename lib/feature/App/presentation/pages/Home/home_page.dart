import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_lastSent/home_last_sent_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_specialForYou/home_special_for_you_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/last_sent_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/mixin/home_page_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/speacial_for_you_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/sliver_appbar.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

/// This page is the home page of the application.
/// 
/// It contains two tabs, [SpeacialForYouPageView] and [LastSentPageView].
class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          controller: scrollControllerNested,
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
               SliverAppBarWidget(
                text: 'home',
                tabbar: TabBar(
                  tabs: [
                    Tab(text: 'specialForYou'.tr()),
                    Tab(text: 'lastShared'.tr()),
                  ],
                ),
              ),
            ];
          },
          body: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl.get<HomeLastSentCubit>(),
              ),
              BlocProvider(
                create: (context) => sl.get<HomeSpecialForYouCubit>(),
              )
            ],
            child: Builder(
              builder: (context) {
                return TabBarView(
                  children: [
                    SpeacialForYouPageView(
                      scrollControllerNested: scrollControllerNested,
                    ),
                    LastSentPageView(
                        scrollControllerNested: scrollControllerNested),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
