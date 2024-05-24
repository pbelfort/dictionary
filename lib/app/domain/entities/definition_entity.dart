class DefinitionEntity {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;
  final String? example;

  DefinitionEntity({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });
}
