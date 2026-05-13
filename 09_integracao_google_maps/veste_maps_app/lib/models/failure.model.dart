class Failure {
  final String title;
  final String description;
  final int statusCode;

  const Failure({
    required this.title,
    required this.description,
    required this.statusCode,
  });

  @override
  String toString() =>
      'Failure(title: $title, description: $description, statusCode: $statusCode)';
}
