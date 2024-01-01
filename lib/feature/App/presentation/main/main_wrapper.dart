import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/main/widget/bottom_nav_bar.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

@RoutePage()
class MainWrapperView extends StatefulWidget {
  const MainWrapperView({super.key});

  @override
  State<MainWrapperView> createState() => _MainWrapperViewState();
}

class _MainWrapperViewState extends State<MainWrapperView>{



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocBuilder<BottomNavCubit, BottomNavBarPages>(
        builder: (BuildContext context, BottomNavBarPages state) {
          print("Bura çalıştı");
          
          return LazyLoadIndexedStack(index: state.index, children: BlocProvider.of<BottomNavCubit>(context).pages);
        },
      ),
      bottomNavigationBar: const MainWrapperNavigationBar(),
    ));
  }
}
