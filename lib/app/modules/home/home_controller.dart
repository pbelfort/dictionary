import 'dart:convert';

import 'package:dictionary/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../base/shared/application_controller.dart';
import '../../data/repository/word/i_word_repository.dart';
import '../../domain/entities/word_entity.dart';
import '../../theme/app_colors.dart';

class HomePageController extends ApplicationController {
  final List<Widget> fruits = const <Widget>[
    Text('Word list'),
    Text('History'),
    Text('Favorites')
  ];
  final RxList<bool> selectedFruits = <bool>[true, false, false].obs;
  RxMap data = {}.obs;

  final IWordRepository iWordRepository;

  Rx<WordEntity> wordEntity = WordEntity(
    word: '',
    phonetics: [],
    meanings: [],
    license: null,
    sourceUrls: [],
  ).obs;

  HomePageController({
    required this.iWordRepository,
  });

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
        await rootBundle.loadString('assets/words_dictionary2.json');
    data.value = await json.decode(response);
  }

  Future<void> goToWordPage(String word) async {
    final result = await iWordRepository.getWordAttributes(word);
    if (result == null) {
      showSnackBar(
        title: 'title',
        message: 'message',
        backgroundColor: green,
        colorText: red,
        iconData: Icons.abc,
        iconColor: red,
      );
      return;
    }
    wordEntity.value = result;

    Get.toNamed(Routes.WORD, arguments: {
      'wordEntity': wordEntity.value,
    });
  }
}
