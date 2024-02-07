import 'package:logger/logger.dart';

/// The `AppLogger` class provides a centralized logging mechanism for the Flutter app.
final class AppLogger extends Logger {
  /// Constructor to initialize `AppLogger`.
  AppLogger()
      : super(
          printer: _CustomPrinter(),
        );
}

final class _CustomPrinter extends PrettyPrinter {
  _CustomPrinter({
    int methodCount = 2,
    int errorMethodCount = 8,
    int lineLength = 120,
    bool colors = true,
    bool printEmojis = true,
    bool printTime = true,
  }) : super(
          methodCount: methodCount,
          errorMethodCount: errorMethodCount,
          lineLength: lineLength,
          colors: colors,
          printEmojis: printEmojis,
          printTime: printTime,
        );
}
