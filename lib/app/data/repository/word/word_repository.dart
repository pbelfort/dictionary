import 'package:either_dart/either.dart';
import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../domain/entities/word_entity.dart';
import '../../provider/word/i_word_provider.dart';
import 'i_word_repository.dart';

class WordRepository implements IWordRepository {
  final IWordProvider provider;
  WordRepository({required this.provider});

  @override
  Future<Either<HttpError, WordEntity>> getWordAttributes(String word) async {
    final response = await provider.getWordAttributesFromApi(word);
    return response;
  }

  @override
  void saveWordInDB(String responseJson) {
    return provider.saveWordInDB(responseJson);
  }

  @override
  String getWordsFromDB() {
    return provider.getWordsFromDB();
  }

  @override
  bool hasWordsDBValues() {
    return provider.hasWordsDBValues();
  }
}
