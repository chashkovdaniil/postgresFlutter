class ProjectNullException implements Exception {
  final String message = 'Project equals null';

  @override
  String toString() => message;
}
