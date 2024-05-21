import 'package:dictionary/app/base/shared/application_controller.dart';
import 'package:get/get.dart';

class WordController extends ApplicationController {
  final String word = Get.parameters['word'] ?? '';
}
