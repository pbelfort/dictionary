import 'license_entity.dart';

class PhoneticEntity {
  final String? text;
  final String audio;
  final String? sourceUrl;
  final LicenseEntity? license;

  PhoneticEntity({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    required this.license,
  });
}
