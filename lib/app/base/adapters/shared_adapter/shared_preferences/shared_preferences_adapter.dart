import 'package:shared_preferences/shared_preferences.dart';

import 'i_shared_preferences_adapter.dart';

class SharedPreferencesAdapter implements ISharedPreferencesAdapter {
  static final SharedPreferencesAdapter _instance =
      SharedPreferencesAdapter._internal();
  SharedPreferences? _preferences;

  factory SharedPreferencesAdapter() {
    return _instance;
  }

  SharedPreferencesAdapter._internal();

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  @override
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  @override
  Future<void> clear() async {
    await _preferences?.clear();
  }
}
