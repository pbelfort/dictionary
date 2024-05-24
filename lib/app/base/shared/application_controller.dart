import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../adapters/database/firebase/firebase_adapter.dart';

abstract class ApplicationController extends GetxController {
  final firebaseAdapter = FirebaseAdapter();

  final RxBool showLoading = false.obs;

  String responseJson = '';

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
