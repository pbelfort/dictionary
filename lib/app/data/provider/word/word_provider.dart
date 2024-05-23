import 'package:either_dart/either.dart';
import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../base/adapters/http_adapter/http/i_http_adapter.dart';
import '../../../base/shared/application_env.dart';
import '../../../domain/entities/word_entity.dart';
import '../../model/word_model.dart';
import 'i_word_provider.dart';

class WordProvider implements IWordProvider {
  final IHttpAdapter http;

  WordProvider({required this.http});

  @override
  Future<Either<HttpError, WordEntity>> getWordAttributesFromApi(
      String word) async {
    final response = await http.get(
      uri: '${AppEnvironment.baseUrl}/$word',
      headers: null,
    );

    if (response.statusCode == 200) {
      return Right(
        WordModel.fromJson(response.body),
      );
    }

    return Left(
      HttpError(
        title: response.body['title'],
        message: response.body['message'],
        statusCode: response.statusCode,
      ),
    );
  }
}
