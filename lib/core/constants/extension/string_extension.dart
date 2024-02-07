import 'package:easy_localization/easy_localization.dart';

/// The `StringLocalization` extension provides a mechanism for converting a [String] object to a localized string.
extension StringLocalization on String {
  String get locale => this.tr();

}

/// The `ImagePathExtension` extension provides a mechanism for converting a [String] object to an image path.
extension ImagePathExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
}

