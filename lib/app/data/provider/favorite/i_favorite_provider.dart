import '../../../domain/entities/favorited_entity.dart';

abstract class IFavoriteProvider {
  Future<void> favorite(FavoritedEntity wordFavorited);
  Future<List<FavoritedEntity>> getAllFavorites();
}
