import 'dart:convert';

import 'package:dictionary/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../base/shared/application_controller.dart';

class HomePageController extends ApplicationController {
  final List<Widget> fruits = const <Widget>[
    Text('Word list'),
    Text('History'),
    Text('Favorites')
  ];
  final RxList<bool> selectedFruits = <bool>[true, false, false].obs;
  RxMap data = {}.obs;

  void favorite() {}

  @override
  onInit() async {
    showLoading.value = true;
    await readJson();
    showLoading.value = false;
    super.onInit();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/words_dictionary.json');
    data.value = await json.decode(response);
  }

  void goToWordPage(String word) {
    Get.toNamed(Routes.WORD, parameters: {
      'word': word,
    });
  }
}
