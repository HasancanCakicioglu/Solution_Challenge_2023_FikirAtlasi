import 'package:easy_localization/easy_localization.dart';

/// The model representing onboarding content for the Idea Atlas application.
class OnBoardingContentModel {
  /// The title of the onboarding content.
  final String title;

  /// The description of the onboarding content.
  final String description;

  /// The image asset path for the onboarding content.
  final String image;

  /// Creates an instance of [OnBoardingContentModel].
  ///
  /// The [title], [description], and [image] parameters are required.
  OnBoardingContentModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

/// A list of predefined onboarding content for the Idea Atlas application.
List<OnBoardingContentModel> onBoardingContentsList = [
  OnBoardingContentModel(
    title: "onboard_title_one".tr(),
    description: "onboard_desc_one".tr(),
    image: "assets/svg/atlas.svg",
  ),
  OnBoardingContentModel(
    title: "onboard_title_two".tr(),
    description: "onboard_desc_two".tr(),
    image: "assets/svg/problem.svg",
  ),
  OnBoardingContentModel(
    title: "onboard_title_three".tr(),
    description: "onboard_desc_three".tr(),
    image: "assets/svg/idea.svg",
  ),
  OnBoardingContentModel(
    title: "onboard_title_four".tr(),
    description: "onboard_desc_four".tr(),
    image: "assets/svg/medias.svg",
  ),
  OnBoardingContentModel(
    title: "onboard_title_five".tr(),
    description: "onboard_desc_five".tr(),
    image: "assets/svg/start.svg",
  ),
];
