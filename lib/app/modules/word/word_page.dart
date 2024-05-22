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
                elevation: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(controller.wordParameter.word),
                      subtitle: controller.wordParameter.phonetics.isNotEmpty
                          ? Text(
                              controller.wordParameter.phonetics.first.text ??
                                  '')
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.wordParameter.phonetics.any(
                  (phonetic) => phonetic.audio.isNotEmpty,
                ),
                child: TextButton(
                  onPressed: controller.play,
                  child: const Text('play'),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.wordParameter.meanings.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.label),
                          title: Text(controller
                              .wordParameter.meanings[index].partOfSpeech),
                        ),
                        ...controller.wordParameter.meanings[index].definitions
                            .map(
                          (definition) => Align(
                            alignment: Alignment.centerLeft,
                            child: Text(definition.definition),
                          ),
                        )
                      ],
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
