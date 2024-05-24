import 'dart:convert';

import '../../domain/entities/favorited_entity.dart';

class FavoritedModel extends FavoritedEntity {
  FavoritedModel({
    required super.uuidUser,
    required super.word,
  });

  factory FavoritedModel.fromMap(Map<String, dynamic> map) {
    return FavoritedModel(
      uuidUser: map['uuidUser'],
      word: map['word'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uuidUser': uuidUser,
        'word': word,
      };

  factory FavoritedModel.fromEntity(FavoritedEntity favorited) {
    return FavoritedModel(
      uuidUser: favorited.uuidUser,
      word: favorited.word,
    );
  }

  static List<FavoritedEntity> decodeFavoritedList(String favoriteString) {
    return (json.decode(favoriteString) as List<dynamic>)
        .map<FavoritedEntity>((item) => FavoritedModel.fromMap(
              item,
            ))
        .toList();
  }
}
