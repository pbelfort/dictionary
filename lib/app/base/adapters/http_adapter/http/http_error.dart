class HttpError implements Exception {
  final int? statusCode;
  final String title;
  final String message;

  HttpError({
    required this.title,
    required this.message,
    required this.statusCode,
  });
}
