import 'dart:convert';
import '../../domain/entities/historic_entity.dart';

class HistoricModel extends HistoricEntity {
  HistoricModel({
    required super.uuidUser,
    required super.word,
    required super.dateTime,
  });

  factory HistoricModel.fromMap(Map<String, dynamic> map) {
    return HistoricModel(
      uuidUser: map['uuidUser'],
      word: map['word'],
      dateTime: DateTime.parse(map['date']),
    );
  }

  Map<String, dynamic> toJson() => {
        'uuidUser': uuidUser,
        'word': word,
        'date': dateTime.toString(),
      };

  factory HistoricModel.fromEntity(HistoricEntity histoic) {
    return HistoricModel(
      uuidUser: histoic.uuidUser,
      word: histoic.word,
      dateTime: histoic.dateTime,
    );
  }

  static List<HistoricEntity> decodeHistoricList(String favoriteString) {
    return (json.decode(favoriteString) as List<dynamic>)
        .map<HistoricEntity>((item) => HistoricModel.fromMap(
              item,
            ))
        .toList();
  }
}
