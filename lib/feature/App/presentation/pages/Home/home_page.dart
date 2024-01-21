import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_lastSent/home_last_sent_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_home_specialForYou/home_special_for_you_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/last_sent_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/mixin/home_page_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/speacial_for_you_page.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with HomePageMixin{

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
              const SliverAppBar(
                title: Text('Home'),
                centerTitle: true,
                floating: true,
                snap: true,
                pinned: false,
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Sana Özel'),
                    Tab(text: 'En Son Paylaşılanlar'),
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
