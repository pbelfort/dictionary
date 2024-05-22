import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../modules/home/home_controller.dart';
import '../../routes/app_pages.dart';

class HomePageMiddleware extends GetMiddleware {
  @override
  void onPageDispose() {
    if (!Get.isRegistered<HomeController>()) {
      return;
    }
    //calls to reload favorites list
    if (Get.currentRoute.endsWith(Routes.HOME)) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        Get.find<HomeController>().refreshFavoriteListMiddleware();
      });
    }
  }
}
