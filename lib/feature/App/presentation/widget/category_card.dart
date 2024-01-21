import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';

import 'package:solution_challenge_2023_recommender_app/feature/App/data/models/category_card_model.dart';


class CategoryCard extends StatelessWidget {
  final CategoryCardModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(CategoryListPageRoute(categoryCardModel: category));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/2838/2838912.png",
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(
              category.categoriesEnum.value,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}