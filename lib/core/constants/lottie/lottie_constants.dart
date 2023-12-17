
abstract final class LottieConstants {

  String get splashScreen => toPng('splash_screen_building');

  String toPng(String name) => 'assets/lottie/$name.json';
}