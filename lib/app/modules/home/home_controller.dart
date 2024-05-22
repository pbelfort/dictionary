import 'dart:convert';
import 'package:dictionary/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
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
  final RxList<bool> selectedToogleButtons = <bool>[true, false, false].obs;
  final RxList<String> favoriteList = <String>[].obs;
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
    data.value = await compute(parseJson, response);
  }

  static Map<String, dynamic> parseJson(String response) {
    return json.decode(response);
  }

  Future<void> goToWordPage(String word) async {
    try {
      final result = await iWordRepository.getWordAttributes(word);

      if (result.isLeft) {
        showSnackBar(
          title: result.left.title,
          message: result.left.message,
          backgroundColor: green,
          colorText: red,
          iconData: Icons.abc,
          iconColor: red,
        );
        return;
      }

      wordEntity.value = result.right;

      Get.toNamed(Routes.WORD, arguments: {
        'wordEntity': wordEntity.value,
      });
    } catch (e) {
      //do nothing
    }
  }

  Future<void> toogleButtonAction(int index) async {
    for (int i = 0; i < selectedToogleButtons.length; i++) {
      selectedToogleButtons[i] = i == index;
    }
    if (index == 2) {
      favoriteList.value = await iWordRepository.getAllFavorites();
    }
  }
}
