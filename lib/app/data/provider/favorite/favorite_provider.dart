import 'dart:convert';

import 'package:dictionary/app/data/provider/favorite/i_favorite_provider.dart';

import '../../../base/adapters/shared_adapter/shared_preferences/shared_preferences_adapter.dart';
import '../../../domain/entities/favorited_entity.dart';
import '../../model/favorited_model.dart';

class FavoriteProvider implements IFavoriteProvider {
  final SharedPreferencesAdapter prefsAdapter = SharedPreferencesAdapter();
  @override
  Future<void> favorite(FavoritedEntity favoritedEntity) async {
    final String? favoritedString = prefsAdapter.getString('favorite_list');

    if (favoritedString != null) {
      final wordFavoritedList =
          FavoritedModel.decodeFavoritedList(favoritedString);

      if (!wordFavoritedList
          .any((favorited) => favorited.word == favoritedEntity.word)) {
        wordFavoritedList.add(FavoritedEntity(
            uuidUser: favoritedEntity.uuidUser, word: favoritedEntity.word));
      } else {
        wordFavoritedList.removeWhere(
            (favoritedItem) => favoritedItem.word == favoritedEntity.word);
      }

      wordFavoritedList.sort((a, b) {
        return a.word.toLowerCase().compareTo(b.word.toLowerCase());
      });

      return await prefsAdapter.setString(
        'favorite_list',
        json.encode(
          wordFavoritedList
              .map<Map<String, dynamic>>(
                  (quiz) => FavoritedModel.fromEntity(quiz).toJson())
              .toList(),
        ),
      );
    }

    List<FavoritedEntity> list = [favoritedEntity];

    return await prefsAdapter.setString(
      'favorite_list',
      json.encode(
        list
            .map<Map<String, dynamic>>(
                (quiz) => FavoritedModel.fromEntity(quiz).toJson())
            .toList(),
      ),
    );
  }

  @override
  Future<List<FavoritedEntity>> getAllFavorites() async {
    final String? favoritedString = prefsAdapter.getString('favorite_list');
    if (favoritedString == null) return [];
    return FavoritedModel.decodeFavoritedList(favoritedString);
  }
}
