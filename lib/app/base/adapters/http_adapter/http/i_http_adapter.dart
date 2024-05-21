import 'package:dictionary/app/base/adapters/http_adapter/http/http_response.dart';

abstract class IHttpAdapter {
  Future<HttpResponse> get({
    required String uri,
    required Map<String, String>? headers,
  });

  Future<HttpResponse> post({
    required String uri,
    required Map<String, String>? headers,
    required dynamic body,
  });
}
