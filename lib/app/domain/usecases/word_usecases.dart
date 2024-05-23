import 'package:either_dart/either.dart';

import '../../base/adapters/http_adapter/http/http_error.dart';
import '../../data/repository/word/i_word_repository.dart';
import '../entities/word_entity.dart';

abstract class WordUsecases {
  static Future<Either<HttpError, WordEntity>> getWordAttributes({
    required IWordRepository iWordRepository,
    required String word,
  }) async {
    return await iWordRepository.getWordAttributes(word);
  }
}
