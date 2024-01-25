

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_category/category_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Category/mixin/category_body_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';

class CategoryListPageBody extends StatefulWidget {
  const CategoryListPageBody({super.key,required this.scrollControllerNested,required this.categoryEnum});
  
  final ScrollController scrollControllerNested;
  final CategoriesEnum categoryEnum;

  @override
  State<CategoryListPageBody> createState() => _CategoryListPageBodyState();
}

class _CategoryListPageBodyState extends State<CategoryListPageBody> with CategoryBodyMixin{
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryLoaded) {
          return ListView.builder(
            itemCount: state.comments.length,
            itemBuilder: (context, index) {
              return CommentsProblemCard(
                commentProblemEntity: state.comments[index]!,
              );
            },
          );
        } else {
          return const Center(
            child: Text("Initial State"),
          );
        }
      }
    );
  }
}