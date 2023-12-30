
import 'package:flutter_svg/flutter_svg.dart';

abstract final class SVGConstants {

  static String get humanHello => toSVG('human_hello');

  static String toSVG(String name) => 'assets/svg/$name.svg';



  static void svgPrecacheImage() {

        final cacheSvgImages = [  /// Specify the all the svg image to cache 
          SVGConstants.humanHello,
        ];
    
        for (String element in cacheSvgImages) {
          var loader = SvgAssetLoader(element);
          svg.cache
              .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
        }

      }
}