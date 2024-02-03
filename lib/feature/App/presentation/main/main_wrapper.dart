import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/bottomNavBar/bottomNavBar_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_profile_entity/profile_entity_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/main/widget/bottom_nav_bar.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/entities/profile_entites.dart';
import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/create_profile_usecase.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

@RoutePage()
class MainWrapperView extends StatefulWidget {
  const MainWrapperView({super.key});

  @override
  State<MainWrapperView> createState() => _MainWrapperViewState();
}

class _MainWrapperViewState extends State<MainWrapperView> {
  @override
  Widget build(BuildContext context) {
    createProfile();
    return BlocProvider<ProfileEntityCubit>(
        create: (context) => sl.get<ProfileEntityCubit>(),
        child: Scaffold(
          body: BlocBuilder<BottomNavCubit, BottomNavBarState>(
            builder: (BuildContext context, BottomNavBarState state) {
              return LazyLoadIndexedStack(
                  index: state.bottomNavBarPages.index,
                  children: BlocProvider.of<BottomNavCubit>(context).pages);
            },
          ),
          bottomNavigationBar: const MainWrapperNavigationBar(),
        ));
  }

  void createProfile() async {
    await sl.get<CreateProfileUsecase>().call(const ProfileEntity());
  }
}
