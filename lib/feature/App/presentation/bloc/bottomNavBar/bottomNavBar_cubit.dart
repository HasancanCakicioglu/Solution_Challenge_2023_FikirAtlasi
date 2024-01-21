// ignore: file_names
import 'package:equatable/equatable.dart';
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

enum BottomNavBarVisibleState{
  visible(true),
  invisible(false);

  final bool isVisible;
  const BottomNavBarVisibleState(this.isVisible);
}


class BottomNavBarState extends Equatable{
  final BottomNavBarPages bottomNavBarPages;
  final BottomNavBarVisibleState bottomNavBarVisibleState;

  const BottomNavBarState({required this.bottomNavBarPages, required this.bottomNavBarVisibleState});

  BottomNavBarState copyWith({BottomNavBarPages? bottomNavBarPages, BottomNavBarVisibleState? bottomNavBarVisibleState}){
    return BottomNavBarState(
      bottomNavBarPages: bottomNavBarPages ?? this.bottomNavBarPages,
      bottomNavBarVisibleState: bottomNavBarVisibleState ?? this.bottomNavBarVisibleState
    );
  }
  
  @override
 
  List<Object?> get props => [bottomNavBarPages.index, bottomNavBarVisibleState.isVisible];
}

// Bottom Navigation Bar Cubit
class BottomNavCubit extends Cubit<BottomNavBarState> {
  BottomNavCubit() :  super(const BottomNavBarState(bottomNavBarPages: BottomNavBarPages.home, bottomNavBarVisibleState: BottomNavBarVisibleState.visible));

  changeSelectedPage(BottomNavBarState newPage) => emit(newPage);


  onDestinationSelected(int index) {
    switch (index) {
      case 0:
        emit(state.copyWith(bottomNavBarPages: BottomNavBarPages.home));
        break;
      case 1:
        emit(state.copyWith(bottomNavBarPages: BottomNavBarPages.search));
        break;
      case 2:
        emit(state.copyWith(bottomNavBarPages: BottomNavBarPages.category));
        break;
      case 3:
        emit(state.copyWith(bottomNavBarPages: BottomNavBarPages.leaderboard));
        break;
    }
  }

  setIsVisible(bool isVisible) {
    emit(state.copyWith(bottomNavBarVisibleState: isVisible ? BottomNavBarVisibleState.visible : BottomNavBarVisibleState.invisible)); // Re-emit the current state to trigger listeners
  }

  final List<Widget> pages = [
    const HomePageView(),
    const searchPage(),
    CategoryPageView(),
    const LeaderBoard(),
  ];

}
