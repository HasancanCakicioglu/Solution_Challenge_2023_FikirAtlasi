/// A base exception class representing errors in the Dart language.
/// Subclasses should be created to represent specific error scenarios.
class DartLanguageException implements Exception {
  /// The title of the exception.
  final String title;

  /// The detailed message describing the exception.
  final String message;

  /// Constructs a [DartLanguageException] with optional [title] and [message].
  DartLanguageException({this.title = 'Dart Language Error', this.message = 'An error occurred in the Dart language'});

  @override
  String toString() {
    return '$title: $message';
  }
}

/// An exception representing a null pointer error in the Dart language.
class DartNullPointerException extends DartLanguageException {
  /// Constructs a [DartNullPointerException] with optional [title] and [message].
  DartNullPointerException({String title = 'Null Pointer Error', String message = 'A null pointer error occurred in the Dart language'})
      : super(title: title, message: message);
}

/// An exception representing an index out of range error in the Dart language.
class DartIndexOutOfRangeException extends DartLanguageException {
  /// Constructs a [DartIndexOutOfRangeException] with optional [title] and [message].
  DartIndexOutOfRangeException({String title = 'Index Out of Range Error', String message = 'An index out of range error occurred in the Dart language'})
      : super(title: title, message: message);
}
