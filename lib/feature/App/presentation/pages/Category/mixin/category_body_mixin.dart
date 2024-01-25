import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_category/category_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Category/category_list_page_body.dart';

mixin CategoryBodyMixin<T extends StatefulWidget> on State<CategoryListPageBody> {


  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryCubit>(context).getCommentProblemListLastRefresh(widget.categoryEnum);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
