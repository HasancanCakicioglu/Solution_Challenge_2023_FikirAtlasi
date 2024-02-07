import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/padding.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/svg/svg_constants.dart';
import 'package:solution_challenge_2023_recommender_app/core/init/navigation/app_router.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/data/models/category_card_model.dart';
import 'package:solution_challenge_2023_recommender_app/feature/App/presentation/widget/category_card.dart';

/// Page view for displaying categories.
/// 
/// This page view displays a grid of category cards.
class CategoryPageView extends StatelessWidget {
  CategoryPageView({Key? key}) : super(key: key);

  final List<CategoryCardModel> categories = List.generate(
    CategoriesEnum.values.length,
    (index) => CategoryCardModel(
      categoriesEnum: CategoriesEnum.values[index],
      image: SVGConstants.svgImagesCategorys[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              leading: profilePageRoute(context),
              actions: [settingPageRoute(context)],
              title: const Text('Categories').tr(),
              centerTitle: true,
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
            ).paddedSymmetric(horizontal: Material3Design.largePagePadding),
          );
      
  }

    IconButton profilePageRoute(BuildContext context){
    
    return IconButton(onPressed: (){
          AutoRouter.of(context).push(ProfilePageRoute(profileID: FirebaseAuth.instance.currentUser!.uid));
        }, icon: const Icon(Icons.person));
  }

  IconButton settingPageRoute(BuildContext context){
    return IconButton(onPressed: (){
          AutoRouter.of(context).push(const SettingsPageRoute());
        }, icon: const Icon(Icons.settings));
  }
}
