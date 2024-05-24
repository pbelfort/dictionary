import 'package:either_dart/either.dart';
import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../domain/entities/word_entity.dart';

abstract class IWordProvider {
  Future<Either<HttpError, WordEntity>> getWordAttributesFromApi(String word);

  Future<void> saveWordInDB(String responseJson);

  String getWordsFromDB();

  bool hasWordsDBValues();
}
