import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxDouble logoWidth = 0.0.obs;
  RxDouble logoHeight = 0.0.obs;

  @override
  Future<void> onReady() async {
    animateLogo();
    _loading();
    animateLogo();
    super.onReady();
  }

  // ignore: always_declare_return_types
  _loading() async {
    await 2.5.delay();

    Get.offAllNamed(Routes.HOME);
  }

  void animateLogo() async {
    logoWidth.value = 400;
    logoHeight.value = 200;
    await 2.5.delay();
  }
}
