import 'package:dictionary/app/domain/entities/meaning_entity.dart';

import 'definition_model.dart';

class MeaningModel extends MeaningEntity {
  MeaningModel({
    required super.partOfSpeech,
    required super.definitions,
    required super.synonyms,
    required super.antonyms,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) {
    return MeaningModel(
      partOfSpeech: json['partOfSpeech'],
      definitions: (json['definitions'] as List)
          .map((i) => DefinitionModel.fromJson(i))
          .toList(),
      synonyms: List<String>.from(json['synonyms']),
      antonyms: List<String>.from(json['antonyms']),
    );
  }
}
