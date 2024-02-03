
import 'package:flutter_svg/flutter_svg.dart';

abstract final class SVGConstants {

  static String get humanHello => toSVG('human_hello');
  static String get atlas => toSVG('atlas');
  static String get idea => toSVG('idea');
  static String get start => toSVG('start');
  static String get problem => toSVG('problem');
  static String get medias => toSVG('medias');
  static String get login => toSVG('login');
  static String get register => toSVG('register');

  static String toSVG(String name) => 'assets/svg/$name.svg';




  static void svgPrecacheImage() {

        final cacheSvgImages = [  /// Specify the all the svg image to cache 
          SVGConstants.humanHello,
          SVGConstants.atlas,
          SVGConstants.idea,
          SVGConstants.start,
          SVGConstants.problem,
          SVGConstants.medias,
          SVGConstants.login,
          SVGConstants.register,
        ];
    
        for (String element in cacheSvgImages) {
          var loader = SvgAssetLoader(element);
          svg.cache
              .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
        }

      }
}