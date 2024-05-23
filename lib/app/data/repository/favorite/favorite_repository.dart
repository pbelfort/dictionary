import '../../../domain/entities/favorited_entity.dart';
import '../../provider/favorite/i_favorite_provider.dart';
import 'i_favorite_repository.dart';

class FavoriteRepository implements IFavoriteRepository {
  final IFavoriteProvider provider;

  FavoriteRepository({required this.provider});

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
}
