import 'package:get/get.dart';
import '../../base/adapters/http_adapter/http/http_adapter.dart';
import '../../base/adapters/http_adapter/http/i_http_adapter.dart';
import '../../data/repository/favorite/i_favorite_repository.dart';
import '../../data/repository/historic/i_historic_repository.dart';
import 'word_controller.dart';

class WordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttpAdapter>(
      () => HttpAdapter(),
    );

    Get.put(
      WordController(
        iHistoricRepository: Get.find<IHistoricRepository>(),
        iFavoriteRepository: Get.find<IFavoriteRepository>(),
      ),
    );
  }
}
