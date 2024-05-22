import 'package:dictionary/app/domain/entities/favorited_entity.dart';
import 'package:either_dart/either.dart';

import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../domain/entities/historic_entity.dart';
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
  Future<void> favorite(FavoritedEntity wordFavorited) async {
    final response = await provider.favorite(wordFavorited);
    return response;
  }

  @override
  Future<List<FavoritedEntity>> getAllFavorites() async {
    final response = await provider.getAllFavorites();
    return response;
  }

  @override
  Future<void> store(HistoricEntity historicEntity) async {
    final response = await provider.store(historicEntity);
    return response;
  }

  @override
  Future<List<HistoricEntity>> getHistoric() async {
    final response = await provider.getHistoric();
    return response;
  }
}
