
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';

//Category card model
final class CategoryCardModel{

  final CategoriesEnum categoriesEnum;
  final String image;

  CategoryCardModel({required this.categoriesEnum, required this.image});

  @override
  //to string method
  String toString() {
    return 'CategoryCardModel{title: $categoriesEnum, image: $image}';
  }

  //equals method
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryCardModel &&
          runtimeType == other.runtimeType &&
          categoriesEnum == other.categoriesEnum &&
          image == other.image;

  //hash code method
  @override
  int get hashCode => categoriesEnum.hashCode ^ image.hashCode;

}