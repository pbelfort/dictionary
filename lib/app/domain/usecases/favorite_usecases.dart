import '../../data/repository/favorite/i_favorite_repository.dart';
import '../entities/favorited_entity.dart';

abstract class FavoriteUsecases {
  static Future<List<FavoritedEntity>> getAllFavorites(
    IFavoriteRepository iFavoriteRepository,
  ) async {
    return await iFavoriteRepository.getAllFavorites();
  }

  static Future<void> favorite({
    required IFavoriteRepository iFavoriteRepository,
    required FavoritedEntity favorited,
  }) async {
    return await iFavoriteRepository.favorite(favorited);
  }
}
