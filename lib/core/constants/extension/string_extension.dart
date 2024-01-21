import 'package:easy_localization/easy_localization.dart';


extension StringLocalization on String {
  String get locale => this.tr();

}

extension ImagePathExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
}