import 'package:uuid/uuid.dart';

/// Helper class
class HelperClass {
  static const Uuid _uuid = Uuid();

  /// Get a unique identifier
  static String getUuid() {
    return _uuid.v4();
  }
}
