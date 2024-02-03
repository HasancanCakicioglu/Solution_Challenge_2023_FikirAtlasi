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
    title: "Welcome to Idea Atlas",
    description: "Welcome to a platform where people share their problems, find solutions, and collaborate! Share your ideas, connect with others, and collectively create solutions.",
    image: "assets/svg/atlas.svg",
  ),
  OnBoardingContentModel(
    title: "Share Your Concerns",
    description: "Share personal or universally relevant issues that concern everyone.",
    image: "assets/svg/problem.svg",
  ),
  OnBoardingContentModel(
    title: "Develop Your Ideas",
    description: "Interact with other users, refine your ideas, and assist each other in the quest for solutions.",
    image: "assets/svg/idea.svg",
  ),
  OnBoardingContentModel(
    title: "Various Media",
    description: "Communicate more effectively by sharing your problems and solution suggestions in text, images, video, or PDF formats.",
    image: "assets/svg/medias.svg",
  ),
  OnBoardingContentModel(
    title: "Safe Travels!",
    description: "Enjoy the journey of sharing your ideas and finding solutions in Idea Atlas. Safe travels!",
    image: "assets/svg/start.svg",
  ),
];
