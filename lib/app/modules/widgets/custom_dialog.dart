import 'package:dictionary/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends GetView {
  const CustomDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actions = const [],
    required this.iconColor,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final String message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      icon: Icon(
        icon,
        color: iconColor,
        size: 50,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      titleTextStyle: const TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      contentTextStyle: const TextStyle(
        color: white,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: actions,
    );
  }
}
