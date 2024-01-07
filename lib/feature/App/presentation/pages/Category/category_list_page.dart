import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/data/models/category_card_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/pages/Category/mixin/category_mixin.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/comments_problem_card.dart';

import 'package:solution_challenge_2023_recommender_app/feature/Firestorage/domain/usecases/get_comment_problem_list_according_to_category_usecase.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryCardModel.categoriesEnum.value),
      ),
      body: FutureBuilder(
          future: sl
              .get<GetCommentProblemListAccordingToCategoryUsecase>()
              .call(widget.categoryCardModel.categoriesEnum, null),
          builder: ((context, snapshot) {
            print(widget.categoryCardModel.categoriesEnum.value);
            if (snapshot.hasData) {
              print("1");
              return snapshot.data!.fold(
                  (l) => Center(
                        child: Text("Error ${l.message}"),
                      ), (r) {
                return ListView.builder(
                  itemCount: r.value1.length,
                  itemBuilder: (context, index) {
                    return CommentsProblemCard(
                      commentProblemEntity: r.value1[index]!,
                    );
                  },
                );
              });
            } else {
              print("2");
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}
