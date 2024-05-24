import '../../data/model/license_model.dart';
import '../../domain/entities/phonetic_entity.dart';

class PhoneticModel extends PhoneticEntity {
  PhoneticModel({
    required super.text,
    required super.audio,
    required super.sourceUrl,
    required super.license,
  });

  factory PhoneticModel.fromJson(Map<String, dynamic> json) {
    return PhoneticModel(
      text: json['text'],
      audio: json['audio'],
      sourceUrl: json['sourceUrl'],
      license: json['license'] != null
          ? LicenseModel.fromJson(json['license'])
          : null,
    );
  }
}
