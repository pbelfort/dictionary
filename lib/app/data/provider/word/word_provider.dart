import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/adapters/http_adapter/http/http_error.dart';
import '../../../base/adapters/http_adapter/http/i_http_adapter.dart';
import '../../../base/adapters/shared_adapter/shared_preferences/shared_preferences_adapter.dart';
import '../../../base/shared/application_env.dart';
import '../../../domain/entities/word_entity.dart';
import '../../model/word_model.dart';
import 'i_word_provider.dart';

class WordProvider implements IWordProvider {
  final IHttpAdapter http;

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
  Future<void> favorite(String wordFavorited) async {
    final SharedPreferencesAdapter prefsAdapter = SharedPreferencesAdapter();

    final String? favoritedString = prefsAdapter.getString('favorite_list');

    if (favoritedString != null) {
      final wordFavoritedList = _decodeFavoritedList(favoritedString);

      if (!wordFavoritedList.contains(wordFavorited)) {
        wordFavoritedList.add(wordFavorited);
      } else {
        wordFavoritedList
            .removeWhere((favoritedItem) => favoritedItem == wordFavorited);
      }

      return await prefsAdapter.setString(
        'favorite_list',
        json.encode(wordFavoritedList),
      );
    }

    List<String> list = [wordFavorited];
    return await prefsAdapter.setString(
      'favorite_list',
      json.encode(
        list,
      ),
    );
  }

  List<String> _decodeFavoritedList(String favorite) {
    return (json.decode(favorite) as List<dynamic>)
        .map<String>((item) => item)
        .toList();
  }

  @override
  Future<List<String>> getAllFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? favoritedString = prefs.getString('favorite_list');
    if (favoritedString == null) return [];

    return _decodeFavoritedList(favoritedString);
  }
}
