// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/index.dart';


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
    CategoryPageView(),
    const LeaderBoard(),
  ];

}