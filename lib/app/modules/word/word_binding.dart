import 'package:get/get.dart';
import 'word_controller.dart';

class WordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WordController());
  }
}
