/// Image Constants
abstract final class ImageConstants {
  ImageConstants._init();

  static String get google => toPng('google');
  static String get apple => toPng('apple');

  static String toPng(String name) => 'assets/image/$name.png';
}
