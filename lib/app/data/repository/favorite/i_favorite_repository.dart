import '../../../domain/entities/favorited_entity.dart';

abstract class IFavoriteRepository {
  Future<void> favorite(FavoritedEntity wordFavoritedwordFavorited);
  Future<List<FavoritedEntity>> getAllFavorites();
}
