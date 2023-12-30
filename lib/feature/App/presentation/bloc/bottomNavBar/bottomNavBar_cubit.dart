import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Category/category_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Leaderboard/leaderboard_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Search/search_page.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/home_page.dart';

// Enum 
// ignore: constant_identifier_names
enum BottomNavBarPages {
  home,
  search,
  category,
  leaderboard;

  
}

// Bottom Navigation Bar Cubit
class BottomNavCubit extends Cubit<BottomNavBarPages> {
  BottomNavCubit() : super(BottomNavBarPages.home);

  changeSelectedPage(BottomNavBarPages newPage) => emit(newPage);

  onDestinationSelected(int index) {
    switch (index) {
      case 0:
        emit(BottomNavBarPages.home);
        break;
      case 1:
        emit(BottomNavBarPages.search);
        break;
      case 2:
        emit(BottomNavBarPages.category);
        break;
      case 3:
        emit(BottomNavBarPages.leaderboard);
        break;
    }
  }

  final List<Widget> pages = [
    const HomePageView(),
    const searchPage(),
    const CategoryPageView(),
    const LeaderBoard(),
  ];

}
