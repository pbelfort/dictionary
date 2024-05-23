import 'package:get/get.dart';

import '../../data/repository/favorite/i_favorite_repository.dart';
import '../../data/repository/historic/i_historic_repository.dart';
import '../../data/repository/word/i_word_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        iWordRepository: Get.find<IWordRepository>(),
        iHistoricRepository: Get.find<IHistoricRepository>(),
        iFavoriteRepository: Get.find<IFavoriteRepository>(),
      ),
    );
  }
}
