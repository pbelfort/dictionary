import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: appBackgroundColor),
      child: Center(
        child: Obx(
          () => AnimatedContainer(
            width: controller.logoWidth.value,
            height: controller.logoHeight.value,
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOut,
            child: Container(
              height: 25,
              width: 25,
              color: green,
            ),
          ),
        ),
      ),
    );
  }
}
