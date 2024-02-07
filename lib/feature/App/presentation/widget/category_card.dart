import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';

import 'package:solution_challenge_2023_recommender_app/feature/App/data/models/category_card_model.dart';

/// Widget for displaying a category card.
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
          AutoRouter.of(context)
              .push(CategoryListPageRoute(categoryCardModel: category));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            svgAssets(context),
            const SizedBox(height: 8.0),
            Text(
              category.categoriesEnum.value,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ).tr(),
          ],
        ),
      ),
    );
  }

  /// Builds SVG asset widget based on the category's image path.
  Widget svgAssets(BuildContext context) {
    return SvgPicture.asset(
      category.image,
      height: MediaQuery.of(context).size.width * 0.3,
      width: MediaQuery.of(context).size.width * 0.3,
      fit: BoxFit.cover,
    );
  }
}
