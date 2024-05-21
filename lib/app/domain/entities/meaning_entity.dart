import 'definition_entity.dart';

class MeaningEntity {
  final String partOfSpeech;
  final List<DefinitionEntity> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  MeaningEntity({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });
}
