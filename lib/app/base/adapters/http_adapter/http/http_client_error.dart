import 'package:http/http.dart';
import 'http_error.dart';

class HttpClientError extends HttpError implements ClientException {
  HttpClientError({
    dynamic data,
    required super.title,
    required super.message,
    required super.statusCode,
  });

  @override
  Uri? get uri => throw UnimplementedError();
}
