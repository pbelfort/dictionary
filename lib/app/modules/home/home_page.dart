import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 1.0,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 25,
                width: 25,
                color: red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
