/// A base class representing failures in the application.
/// Subclasses should be created to represent specific failure scenarios.
abstract class Failure {
  /// The title of the failure.
  final String title;

  /// The detailed message describing the failure.
  final String message;

  /// Constructs a [Failure] with optional [title] and [message].
  const Failure({this.title = '', this.message = ''});
}

/// A specific failure representing issues during network operations.
class NetworkFailure extends Failure {
  /// Constructs a [NetworkFailure] with optional [title] and [message].
  const NetworkFailure({String title = 'Network Error', String message = 'An error occurred during network operation'})
      : super(title: title, message: message);
}

/// A specific failure representing issues during database operations.
class DatabaseFailure extends Failure {
  /// Constructs a [DatabaseFailure] with optional [title] and [message].
  const DatabaseFailure({String title = 'Database Error', String message = 'An error occurred during database operation'})
      : super(title: title, message: message);
}
