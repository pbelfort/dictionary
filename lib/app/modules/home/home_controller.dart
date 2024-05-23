import 'dart:convert';
import 'package:dictionary/app/domain/entities/historic_entity.dart';
import 'package:dictionary/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../base/shared/application_controller.dart';
import '../../data/repository/word/i_word_repository.dart';
import '../../domain/entities/favorited_entity.dart';
import '../../domain/entities/word_entity.dart';
import '../../theme/app_colors.dart';
import '../widgets/custom_dialog.dart';

class HomeController extends ApplicationController {
  bool get _isFavoritedSelected => selectedToogleButtons[2] == true;
  bool get _isHistoricSelected => selectedToogleButtons[1] == true;

  final List<Widget> fruits = const <Widget>[
    Text('Word list'),
    Text('History'),
    Text('Favorites')
  ];

  final RxList<bool> selectedToogleButtons = <bool>[true, false, false].obs;
  final RxList<FavoritedEntity> favoriteList = <FavoritedEntity>[].obs;
  final RxList<HistoricEntity> historicList = <HistoricEntity>[].obs;

  RxMap data = {}.obs;

  Rx<WordEntity> wordEntity = WordEntity(
    word: '',
    phonetics: [],
    meanings: [],
    license: null,
    sourceUrls: [],
  ).obs;

  final IWordRepository iWordRepository;

  HomeController({
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

  Future<void> refreshFavoriteListMiddleware() async {
    showLoading.value = true;
    if (_isFavoritedSelected) {
      favoriteList.value = await iWordRepository.getAllFavorites();
    }
    showLoading.value = false;
  }

  Future<void> toogleButtonAction(int index) async {
    for (int i = 0; i < selectedToogleButtons.length; i++) {
      selectedToogleButtons[i] = i == index;
    }
    if (_isFavoritedSelected) {
      favoriteList.value = await iWordRepository.getAllFavorites();
      return;
    }
    if (_isHistoricSelected) {
      historicList.value = await iWordRepository.getHistoric();
    }
  }

  signOut() async {
    await firebaseAdapter.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  showLogoutDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        icon: Icons.info_outline_rounded,
        title: 'Logout',
        message: 'Deseja realmente sair?',
        iconColor: green,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: white,
              backgroundColor: red,
              minimumSize: const Size(0, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Não',
              textAlign: TextAlign.justify,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: appBackgroundColor,
              backgroundColor: green,
              minimumSize: const Size(0, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: signOut,
            child: const Text(
              'Sim',
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
