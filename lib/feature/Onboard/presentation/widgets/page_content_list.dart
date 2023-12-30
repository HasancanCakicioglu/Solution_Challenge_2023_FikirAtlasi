class OnBoardingContentModel {
  final String title;
  final String description;
  final String image;

  OnBoardingContentModel({
    required this.title,
    required this.description,
    required this.image,
  });
}


List<OnBoardingContentModel> onBoardingContentsList = [
  OnBoardingContentModel(
    title: "Welcome to the App",
    description: "Let's start with the onboarding screens",
    image: "assets/svg/human_hello.svg",
  ),
  OnBoardingContentModel(
    title: "What is the App?",
    description: "The App is a Flutter UI Kit that can speed up your development",
    image: "assets/svg/human_hello.svg",
  ),
  OnBoardingContentModel(
    title: "What is Flutter?",
    description: "Flutter is a cross-platform framework that allows you to create responsive UI",
    image: "assets/svg/human_hello.svg",
  ),
];