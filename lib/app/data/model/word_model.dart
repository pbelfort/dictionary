import '../../domain/entities/word_entity.dart';
import 'license_model.dart';
import 'meaning_model.dart';
import 'phonetic_model.dart';

class WordModel extends WordEntity {
  WordModel({
    required super.word,
    required super.phonetics,
    required super.meanings,
    required super.license,
    required super.sourceUrls,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'],
      phonetics: (json['phonetics'] as List)
          .map((i) => PhoneticModel.fromJson(i))
          .toList(),
      meanings: (json['meanings'] as List)
          .map((i) => MeaningModel.fromJson(i))
          .toList(),
      license: LicenseModel.fromJson(json['license']),
      sourceUrls: List<String>.from(json['sourceUrls']),
    );
  }
}
