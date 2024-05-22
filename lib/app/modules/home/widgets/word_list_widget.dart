import 'package:dictionary/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_text_style.dart';

class WordListWidget extends StatelessWidget {
  final HomeController controller;
  const WordListWidget({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final wordList = controller.data.keys.cast<String>().toList();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: [
            ...wordList.map(
              (word) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: () => controller.goToWordPage(word),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: green,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        word.capitalizeFirst!,
                        style: appTextStyle.withColor(green).withFontSize(14),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
