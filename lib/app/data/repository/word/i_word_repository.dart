import 'package:either_dart/either.dart';
import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../domain/entities/word_entity.dart';

abstract class IWordRepository {
  Future<Either<HttpError, WordEntity>> getWordAttributes(String word);
}
