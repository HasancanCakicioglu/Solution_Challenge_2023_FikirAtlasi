
abstract final class ImageConstants {

  ImageConstants._init();

  String get logo => toPng('veli');

  String get hotDog => toPng('hotdogs');
  String get projeIcon => toPng('cirlce_hwa');

  String toPng(String name) => 'assets/image/$name.png';
}