import 'package:dictionary/app/theme/app_colors.dart';
import 'package:dictionary/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home_controller.dart';

class HistoricListWidget extends StatelessWidget {
  final HomeController controller;

  const HistoricListWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.historicList.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 200.0),
            child: Text(
              'You dont have any item in history list!',
              style: appTextStyle.withColor(white),
            ),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: controller.historicList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 1.0,
                ),
                child: ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(
                    controller.historicList[index].word,
                    style: appTextStyle.withColor(white).withFontSize(18),
                  ),
                  subtitle: Text(
                    DateFormat('yyyy-MM-dd hh:mm')
                        .format(controller.historicList[index].dateTime),
                    style: appTextStyle.withColor(white).withFontSize(18),
                  ),
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
