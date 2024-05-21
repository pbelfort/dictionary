import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ApplicationController extends GetxController {
  final RxBool showLoading = false.obs;

  final ScrollController scrollController = ScrollController();

  final FocusNode focusNode = FocusNode();

  void focusNodeListener({
    required Function() hasFocusAction,
    required Function() hasNoFocusAction,
  }) {
    focusNode.addListener(
      () => focusNode.hasFocus ? hasFocusAction() : hasNoFocusAction(),
    );
  }

  void showSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
    required Color colorText,
    required IconData iconData,
    required Color iconColor,
  }) {
    Get.snackbar(
      title,
      message,
      instantInit: true,
      colorText: colorText,
      backgroundColor: backgroundColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(16),
      icon: Icon(
        iconData,
        color: iconColor,
      ),
    );
  }

  void scrollUpPage() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  void srcollDownPage() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  Future<void> showCustomDialog({
    required BuildContext context,
    required Widget customDialog,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return customDialog;
      },
    );
  }
}
