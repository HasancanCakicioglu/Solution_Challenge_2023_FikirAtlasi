import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/last_sent_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Home/speacial_for_you_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>{

    
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
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
          body: const TabBarView(
            children: [
              
              SpeacialForYouPageView(),
        
              LastSentPageView(),
            ],
          ),
        ),
      ),
    );
  }
  
  
}

