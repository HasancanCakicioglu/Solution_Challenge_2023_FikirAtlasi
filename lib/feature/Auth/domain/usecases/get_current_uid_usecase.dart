import 'package:solution_challenge_2023_recommender_app/feature/Auth/domain/repository/auth_repository.dart';

/// `GetCurrentUIdUsecase` is a use case class responsible for retrieving the UID (User ID)
/// of the currently authenticated user.
///
/// This class encapsulates the business logic for fetching the UID and interacts with the
/// provided [AuthRepository] for authentication-related operations.
class GetCurrentUIdUsecase {
  final AuthRepository repository;

  /// Constructs a `GetCurrentUIdUsecase` with the provided [repository].
  GetCurrentUIdUsecase(this.repository);

  /// Invokes the use case and returns a [Future] containing the UID as a [String],
  /// or `null` if no user is authenticated.
  Future<String?> call() async{
    return await repository.getCurrentUId();
  }
}
