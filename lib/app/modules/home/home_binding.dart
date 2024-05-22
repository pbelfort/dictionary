import 'package:get/get.dart';

import '../../base/adapters/http_adapter/http/http_adapter.dart';
import '../../base/adapters/http_adapter/http/i_http_adapter.dart';
import '../../data/provider/word/i_word_provider.dart';
import '../../data/provider/word/word_provider.dart';
import '../../data/repository/word/i_word_repository.dart';
import '../../data/repository/word/word_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttpAdapter>(
      () => HttpAdapter(),
    );

    Get.lazyPut<IWordProvider>(
      () => WordProvider(
        http: Get.find<IHttpAdapter>(),
      ),
    );
    Get.lazyPut<IWordRepository>(
      () => WordRepository(
        provider: Get.find<IWordProvider>(),
      ),
    );
    Get.put(
      HomePageController(
        iWordRepository: Get.find<IWordRepository>(),
      ),
    );
  }
}
