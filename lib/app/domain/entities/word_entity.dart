import 'license_entity.dart';
import 'meaning_entity.dart';
import 'phonetic_entity.dart';

class WordEntity {
  final String word;
  final List<PhoneticEntity> phonetics;
  final List<MeaningEntity> meanings;
  final LicenseEntity license;
  final List<String> sourceUrls;

  WordEntity({
    required this.word,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });
}
