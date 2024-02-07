import 'package:easy_localization/easy_localization.dart';

/// The `TimeAgoExtension` extension provides a mechanism for converting a [DateTime] object to a time ago string.
extension TimeAgoExtension on DateTime {
  String timeAgo() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return 'secondago'.tr(args: ['${difference.inSeconds}']);
    } else if (difference.inMinutes < 60) {
      return 'minuteago'.tr(args: ['${difference.inMinutes}']);
    } else if (difference.inHours < 24) {
      return 'hourago'.tr(args: ['${difference.inHours}']);
    } else if (difference.inDays < 7) {
      return 'dayago'.tr(args: ['${difference.inDays}']);
    } else if ((difference.inDays / 7).floor() == 1) {
      return 'weekago'.tr(args: ["1"]);
    } else if (difference.inDays < 30) {
      return 'weekago'.tr(args: ['${(difference.inDays / 7).floor()}']);
    } else if (difference.inDays < 365) {
      return 'monthago'.tr(args: ['${(difference.inDays / 30).floor()}']);
    } else {
      return 'yearago'.tr(args: ['${(difference.inDays / 365).floor()}']);
    }
  }
}

/// The `TimeAgoStringExtension` extension provides a mechanism for converting a [String] object to a time ago string.
extension TimeAgoStringExtension on String {
  String timeAgoString() {
    final DateTime dateTime = DateTime.parse(this);
    return dateTime.timeAgo();
  }
}
