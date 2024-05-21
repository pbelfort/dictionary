import 'package:dictionary/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import 'word_controller.dart';

class WordPage extends GetView<WordController> {
  const WordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(controller.word),
                    subtitle: const Text(
                        'Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Meanings',
                style: appTextStyle.withFontSize(28),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'blablablalba',
                style: appTextStyle.withFontSize(16),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: Get.back,
                  child: const Text('Voltar'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Próximo'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
