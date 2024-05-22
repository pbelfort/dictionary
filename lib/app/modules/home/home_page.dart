import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      fillColor: mediumGreen,
                      color: green,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 80.0,
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
                    return Expanded(
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: [
                          ...controller.data.keys.map(
                            (e) => Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: green,
                                ),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () => controller.goToWordPage(e),
                                  child: Text(
                                    e,
                                    style: appTextStyle.withColor(green),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (controller.selectedToogleButtons[1] == true) {
                    return const Text('History');
                  }
                  return Column(
                    children: [
                      const Text('Favorites'),
                      ...controller.favoriteList.map(
                        (e) => ListTile(
                          leading: const Icon(Icons.star),
                          title: Text(e),
                        ),
                      ),
                    ],
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
