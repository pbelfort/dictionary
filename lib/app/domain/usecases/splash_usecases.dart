import 'package:flutter/services.dart';

import '../../base/adapters/shared_adapter/shared_preferences/shared_preferences_adapter.dart';

abstract class SplashUsecases {
  static final SharedPreferencesAdapter _prefsAdapter =
      SharedPreferencesAdapter();

  static saveWordInDB() async {
    final responseJson =
        await rootBundle.loadString('assets/words_dictionary.json');

    _prefsAdapter.setString('wordDB', responseJson);
  }
}
