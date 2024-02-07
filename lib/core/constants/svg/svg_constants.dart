import 'package:flutter_svg/flutter_svg.dart';

/// The `SVGConstants` class provides a centralized mechanism for managing SVG images.
abstract final class SVGConstants {
  /// SVG Images
  static String get atlas => toSVG('atlas');
  static String get idea => toSVG('idea');
  static String get start => toSVG('start');
  static String get problem => toSVG('problem');
  static String get medias => toSVG('medias');
  static String get login => toSVG('login');
  static String get register => toSVG('register');

  // Category
  static String get education => toSVG('education');
  static String get health => toSVG('health');
  static String get artAndCulture => toSVG('art_and_culture');
  static String get economy => toSVG('economy');
  static String get other => toSVG('other');
  static String get security => toSVG('security');
  static String get technology => toSVG('technology');
  static String get sports => toSVG('sports');
  static String get transportation => toSVG('transportation');
  static String get policy => toSVG('policy');
  static String get entertainment => toSVG('entertainment');
  static String get environment => toSVG('environment');

  static String toSVG(String name) => 'assets/svg/$name.svg';

  /// Precache the SVG images
  static void svgPrecacheImage() {
    final cacheSvgImages = [
      /// Specify the all the svg image to cache
      SVGConstants.atlas,
      SVGConstants.idea,
      SVGConstants.start,
      SVGConstants.problem,
      SVGConstants.medias,
      SVGConstants.login,
      SVGConstants.register,

      // Category
      SVGConstants.education,
      SVGConstants.health,
      SVGConstants.artAndCulture,
      SVGConstants.economy,
      SVGConstants.other,
      SVGConstants.security,
      SVGConstants.technology,
      SVGConstants.sports,
      SVGConstants.transportation,
      SVGConstants.policy,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }

  /// Get the SVG images category
  static List<String> get svgImagesCategorys => [
        education,
        transportation,
        economy,
        health,
        technology,
        artAndCulture,
        sports,
        entertainment,
        environment,
        policy,
        security,
        other
      ];
}
