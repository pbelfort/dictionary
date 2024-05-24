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
    await animateLogo();
    loading();

    super.onReady();
  }

  // ignore: always_declare_return_types
  Future<void> loading() async {
    final hasWordsDBValues = WordUsecases.hasWordsDBValues(iWordRepository);

    if (!hasWordsDBValues) {
      await WordUsecases.saveWordInDB(iWordRepository);
    }

    if (firebaseAdapter.userIsLoggedIn()) {
      Get.toNamed(Routes.HOME);
      return;
    }

    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> animateLogo() async {
    logoWidth.value = 600;
    logoHeight.value = 300;
    await 5.0.delay();
  }
}
