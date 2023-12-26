import 'package:easy_localization/easy_localization.dart';
import 'package:logger/logger.dart';
import 'package:solution_challenge_2023_recommender_app/core/logger/app_logger.dart';
import 'package:solution_challenge_2023_recommender_app/injection.dart';



extension StringLocalization on String {
  String get locale => this.tr();

}

extension ImagePathExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
}