import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
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

  static saveWordInDB(
    IWordRepository iWordRepository,
  ) async {
    final responseJson =
        await rootBundle.loadString('assets/words_dictionary.json');

    iWordRepository.saveWordInDB(responseJson);
  }

  static String getWordsFromDB(
    IWordRepository iWordRepository,
  ) {
    return iWordRepository.getWordsFromDB();
  }

  static bool hasWordsDBValues(
    IWordRepository iWordRepository,
  ) {
    return iWordRepository.hasWordsDBValues();
  }
}
