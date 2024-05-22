import 'dart:convert';
import 'package:dictionary/app/data/model/favorited_model.dart';
import 'package:dictionary/app/domain/entities/favorited_entity.dart';
import 'package:dictionary/app/domain/entities/historic_entity.dart';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../base/adapters/http_adapter/http/i_http_adapter.dart';
import '../../../base/adapters/shared_adapter/shared_preferences/shared_preferences_adapter.dart';
import '../../../base/shared/application_env.dart';
import '../../../domain/entities/word_entity.dart';
import '../../model/historic_model.dart';
import '../../model/word_model.dart';
import 'i_word_provider.dart';

class WordProvider implements IWordProvider {
  final IHttpAdapter http;
  final SharedPreferencesAdapter prefsAdapter = SharedPreferencesAdapter();

  WordProvider({required this.http});

  @override
  Future<Either<HttpError, WordEntity>> getWordAttributesFromApi(
      String word) async {
    final response = await http.get(
      uri: '${AppEnvironment.baseUrl}/$word',
      headers: null,
    );

    if (response.statusCode == 200) {
      return Right(
        WordModel.fromJson(response.body),
      );
    }

    return Left(
      HttpError(
        title: response.body['title'],
        message: response.body['message'],
        statusCode: response.statusCode,
      ),
    );
  }

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
  Future<void> store(HistoricEntity historicEntity) async {
    final String? historicString = prefsAdapter.getString('historic_list');

    if (historicString != null) {
      final wordHistoricList = HistoricModel.decodeHistoricList(historicString);

      if (!wordHistoricList
          .any((stored) => stored.word == historicEntity.word)) {
        wordHistoricList.add(
          HistoricEntity(
            uuidUser: historicEntity.uuidUser,
            word: historicEntity.word,
            dateTime: historicEntity.dateTime,
          ),
        );
      } else {
        final duplicatedIndex = wordHistoricList.indexWhere(
            (favoritedItem) => favoritedItem.word == historicEntity.word);

        final updatedHistoricItem = HistoricEntity(
          uuidUser: historicEntity.uuidUser,
          word: historicEntity.word,
          dateTime: DateTime.now(),
        );

        wordHistoricList[duplicatedIndex] = updatedHistoricItem;
      }

      wordHistoricList.sort((a, b) {
        return b.dateTime.compareTo(
          a.dateTime,
        );
      });

      return await prefsAdapter.setString(
        'historic_list',
        json.encode(
          wordHistoricList
              .map<Map<String, dynamic>>(
                  (quiz) => HistoricModel.fromEntity(quiz).toJson())
              .toList(),
        ),
      );
    }

    List<HistoricEntity> list = [historicEntity];
    return await prefsAdapter.setString(
      'historic_list',
      json.encode(
        list
            .map<Map<String, dynamic>>(
                (quiz) => HistoricModel.fromEntity(quiz).toJson())
            .toList(),
      ),
    );
  }

  @override
  Future<List<FavoritedEntity>> getAllFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? favoritedString = prefs.getString('favorite_list');
    if (favoritedString == null) return [];

    return FavoritedModel.decodeFavoritedList(favoritedString);
  }

  @override
  Future<List<HistoricEntity>> getHistoric() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? historicString = prefs.getString('historic_list');
    if (historicString == null) return [];

    return HistoricModel.decodeHistoricList(historicString);
  }
}
