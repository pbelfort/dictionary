import 'package:dictionary/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import 'widgets/player_widget.dart';
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
      extendBody: true,
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 1.0,
          ),
          child: Column(
            children: [
              Card(
                color: darkGray,
                elevation: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.wordParameter.word,
                            style:
                                appTextStyle.withColor(white).withFontSize(22),
                          ),
                          IconButton(
                            onPressed: controller.favorite,
                            icon: Obx(
                              () => Icon(
                                Icons.star,
                                color: controller.favorited.value
                                    ? green
                                    : ligthGray,
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: controller.wordParameter.phonetics.isNotEmpty
                          ? Text(
                              controller.wordParameter.phonetics.first.text ??
                                  '',
                              style: appTextStyle.withColor(white),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.wordParameter.phonetics.any(
                  (phonetic) => phonetic.audio.isNotEmpty,
                ),
                child: PlayerWidget(
                  player: controller.audioAdapter.player,
                  playAction: controller.play,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.wordParameter.meanings.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 1.0,
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.label,
                              size: 20,
                              color: ligthGray,
                            ),
                            title: Text(
                              controller
                                  .wordParameter.meanings[index].partOfSpeech,
                              style: appTextStyle
                                  .withColor(white)
                                  .withFontSize(22),
                            ),
                          ),
                          ...controller
                              .wordParameter.meanings[index].definitions
                              .map(
                            (definition) => Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                definition.definition,
                                style: appTextStyle
                                    .withColor(white)
                                    .withFontSize(18),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
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
      ),
    );
  }
}
