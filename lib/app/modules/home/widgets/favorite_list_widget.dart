import 'package:dictionary/app/theme/app_colors.dart';
import 'package:dictionary/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class FavoriteListWidget extends StatelessWidget {
  final HomeController controller;

  const FavoriteListWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.favoriteList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 200.0),
            child: Text(
              'You dont have any item in favorite list!',
              style: appTextStyle.withColor(white),
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: controller.favoriteList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 1.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.star),
                  title: Text(
                    controller.favoriteList[index].word,
                    style: appTextStyle.withColor(white).withFontSize(18),
                  ),
                  onTap: () => controller
                      .goToWordPage(controller.favoriteList[index].word),
                  iconColor: green,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
