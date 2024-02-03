import 'package:uuid/uuid.dart';

class HelperClass {
  static const Uuid _uuid = Uuid();

  static String getUuid() {
    return _uuid.v4();
  }
}
