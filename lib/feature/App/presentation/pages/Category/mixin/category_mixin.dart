import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Category/category_list_page.dart';

/// Category mixin for [CategoryListPageView]
/// 
/// This mixin contains the scroll controller for the nested scroll view
mixin CategoryMixin<T extends StatefulWidget> on State<CategoryListPageView> {
  late ScrollController scrollControllerNested;

  @override
  void initState() {
    super.initState();
    scrollControllerNested = ScrollController();
  }

  @override
  void dispose() {
    scrollControllerNested.dispose();
    super.dispose();
  }
}
