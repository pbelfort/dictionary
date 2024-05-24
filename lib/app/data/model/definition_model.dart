import '../../domain/entities/definition_entity.dart';

class DefinitionModel extends DefinitionEntity {
  DefinitionModel({
    required super.definition,
    required super.synonyms,
    required super.antonyms,
    required super.example,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) {
    return DefinitionModel(
      definition: json['definition'],
      synonyms: List<String>.from(json['synonyms']),
      antonyms: List<String>.from(json['antonyms']),
      example: json['example'],
    );
  }
}
