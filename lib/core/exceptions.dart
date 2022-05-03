class ProjectNullException implements Exception {
  final String message = 'Project equals null';

  @override
  String toString() => message;
}

class UserNotAuthExceptions implements Exception {
  final String message = 'User not auth';

  @override
  String toString() => message;
}
