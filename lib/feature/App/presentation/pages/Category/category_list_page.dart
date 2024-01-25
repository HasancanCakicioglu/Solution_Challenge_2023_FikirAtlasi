import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/data/models/category_card_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/bloc/cubit_category/category_cubit.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Category/category_list_page_body.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Category/mixin/category_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';

@RoutePage()
class CategoryListPageView extends StatefulWidget {
  final CategoryCardModel categoryCardModel;

  const CategoryListPageView({super.key, required this.categoryCardModel});

  @override
  State<CategoryListPageView> createState() => _CategoryListPageViewState();
}

class _CategoryListPageViewState extends State<CategoryListPageView>
    with CategoryMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<CategoryCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: NestedScrollView(
              controller: scrollControllerNested,
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  const SliverAppBar(
                    title: Text('Category'),
                    centerTitle: true,
                    floating: true,
                    snap: true,
                    pinned: false,
                  ),
                ];
              },
              body: CategoryListPageBody(
                scrollControllerNested: scrollControllerNested,
                categoryEnum: widget.categoryCardModel.categoriesEnum,
              ),
            ),
          );
        },
      ),
    );
  }
}
