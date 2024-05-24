import '../../domain/entities/license_entity.dart';

class LicenseModel extends LicenseEntity {
  LicenseModel({
    required super.name,
    required super.url,
  });

  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
