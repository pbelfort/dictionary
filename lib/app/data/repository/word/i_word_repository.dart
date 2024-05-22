import 'package:either_dart/either.dart';

import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../domain/entities/favorited_entity.dart';
import '../../../domain/entities/historic_entity.dart';
import '../../../domain/entities/word_entity.dart';

abstract class IWordRepository {
  Future<Either<HttpError, WordEntity>> getWordAttributes(String word);
  Future<void> favorite(FavoritedEntity wordFavoritedwordFavorited);
  Future<List<FavoritedEntity>> getAllFavorites();
  Future<void> store(HistoricEntity historicEntity);
  Future<List<HistoricEntity>> getHistoric();
}
