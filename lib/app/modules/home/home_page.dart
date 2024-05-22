import 'package:dictionary/app/modules/home/widgets/favorite_list_widget.dart';
import 'package:dictionary/app/modules/home/widgets/historic_list_widget.dart';
import 'package:dictionary/app/modules/home/widgets/word_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) async =>
                          await controller.toogleButtonAction(index),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: green,
                      selectedColor: Colors.white,
                      borderColor: appBackgroundColor,
                      fillColor: mediumGreen,
                      color: green,
                      textStyle: appTextStyle
                          .withFontSize(18)
                          .withFontWeight(FontWeight.bold),
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 120.0,
                      ),
                      isSelected: controller.selectedToogleButtons,
                      children: controller.fruits,
                    ),
                  ),
                ],
              ),
              Obx(
                () {
                  if (controller.showLoading.value) {
                    return const LinearProgressIndicator(
                      color: green,
                    );
                  }
                  if (controller.selectedToogleButtons[0] == true) {
                    return WordListWidget(
                      controller: controller,
                    );
                  }
                  if (controller.selectedToogleButtons[1] == true) {
                    return HistoricListWidget(
                      controller: controller,
                    );
                  }
                  return FavoriteListWidget(
                    controller: controller,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
