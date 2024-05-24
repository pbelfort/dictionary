import 'dart:convert';
import 'package:dictionary/app/base/shared/application_binding.dart';
import 'package:dictionary/app/data/model/favorited_model.dart';
import 'package:dictionary/app/domain/entities/favorited_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    ApplicationBinding().dependencies();
  });
  test('Favorite decode list test', () async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences mockPreferences = await SharedPreferences.getInstance();

    final favorite = FavoritedEntity(
      uuidUser: 'uuidUser-123456',
      word: 'word',
    );

    List<FavoritedEntity> list = [favorite];

    await mockPreferences.setString(
      'favorite_list',
      json.encode(
        list
            .map<Map<String, dynamic>>(
                (favorite) => FavoritedModel.fromEntity(favorite).toJson())
            .toList(),
      ),
    );

    final String? favoritedString = mockPreferences.getString('favorite_list');

    assert(favoritedString != null);

    final decodedList = FavoritedModel.decodeFavoritedList(favoritedString!);

    expect(decodedList.isNotEmpty, true);
    expect(decodedList.first.word, equals('word'));
  });
}
