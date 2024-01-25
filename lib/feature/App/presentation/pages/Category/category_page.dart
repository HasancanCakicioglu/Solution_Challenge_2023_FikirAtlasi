import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/data/models/category_card_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/category_card.dart';


class CategoryPageView extends StatelessWidget {
  CategoryPageView({Key? key}) : super(key: key);

  final List<CategoryCardModel> categories = List.generate(
    CategoriesEnum.values.length,
    (index) => CategoryCardModel(
      categoriesEnum: CategoriesEnum.values[index],
      image: "https://cdn-icons-png.flaticon.com/512/2838/2838912.png",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text('Category Page'),
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(category: categories[index]);
              },
            ),
          );
      
  }
}
