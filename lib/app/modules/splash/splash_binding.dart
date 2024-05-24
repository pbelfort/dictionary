import 'package:get/get.dart';

import '../../data/repository/word/i_word_repository.dart';
import 'splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(
        iWordRepository: Get.find<IWordRepository>(),
      ),
    );
  }
}
