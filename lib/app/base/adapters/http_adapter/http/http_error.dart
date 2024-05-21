class HttpError implements Exception {
  final int? statusCode;
  final String message;

  HttpError({
    required this.message,
    required this.statusCode,
  });
}
