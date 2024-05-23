import 'package:dictionary/app/base/shared/application_controller.dart';
import 'package:dictionary/app/domain/usecases/word_usecases.dart';
import 'package:get/get.dart';
import '../../data/repository/word/i_word_repository.dart';
import '../../routes/app_pages.dart';

class SplashController extends ApplicationController {
  RxDouble logoWidth = 0.0.obs;
  RxDouble logoHeight = 0.0.obs;

  final IWordRepository iWordRepository;

  SplashController({required this.iWordRepository});

  @override
  Future<void> onReady() async {
    animateLogo();
    _loading();
    animateLogo();
    super.onReady();
  }

  // ignore: always_declare_return_types
  Future<void> _loading() async {
    final hasWordsDBValues = WordUsecases.hasWordsDBValues(iWordRepository);

    if (!hasWordsDBValues) {
      await WordUsecases.saveWordInDB(iWordRepository);
    }

    if (firebaseAdapter.userIsLoggedIn()) {
      await 2.5.delay();
      Get.offAllNamed(Routes.HOME);
      return;
    }

    Get.offAllNamed(Routes.LOGIN);
  }

  void animateLogo() async {
    logoWidth.value = 400;
    logoHeight.value = 200;
    await 0.5.delay();
  }
}
