import 'package:either_dart/either.dart';

import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../domain/entities/favorited_entity.dart';
import '../../../domain/entities/historic_entity.dart';
import '../../../domain/entities/word_entity.dart';

abstract class IWordProvider {
  Future<Either<HttpError, WordEntity>> getWordAttributesFromApi(String word);
  Future<void> favorite(FavoritedEntity wordFavorited);
  Future<List<FavoritedEntity>> getAllFavorites();
  Future<void> store(HistoricEntity historicEntity);
  Future<List<HistoricEntity>> getHistoric();
}
