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
  Future<void> favorite(String wordFavorited) async {
    final response = await provider.favorite(wordFavorited);
    return response;
  }

  @override
  Future<List<String>> getAllFavorites() async {
    final response = await provider.getAllFavorites();
    return response;
  }
}
