import 'dart:convert';

import 'package:dictionary/app/base/adapters/http_adapter/http/http_response.dart';
import 'package:http/http.dart';
import 'http_client_error.dart';
import 'i_http_adapter.dart';

class HttpAdapter implements IHttpAdapter {
  final Client http = Client();

  HttpAdapter();

  @override
  Future<HttpResponse> get({
    required String uri,
    required Map<String, String>? headers,
  }) async {
    try {
      final url = Uri.parse(uri);
      final response = await http.get(url, headers: headers);
      final jsonBody = jsonDecode(response.body);

      return HttpResponse(
        body: jsonBody,
        statusCode: response.statusCode,
      );
    } on ClientException catch (e) {
      throw HttpClientError(
        message: e.message,
        statusCode: 500,
      );
    }
  }

  @override
  Future<HttpResponse> post({
    required String uri,
    required Map<String, String>? headers,
    required dynamic body,
  }) async {
    try {
      final url = Uri.parse(uri);
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      final jsonBody = jsonDecode(response.body)['data'];
      return HttpResponse(
        body: jsonBody,
        statusCode: response.statusCode,
      );
    } on ClientException catch (e) {
      throw HttpClientError(
        message: e.message,
        statusCode: 500,
      );
    }
  }
}
