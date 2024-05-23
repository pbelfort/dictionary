import 'package:get/get.dart';

import '../../data/provider/favorite/favorite_provider.dart';
import '../../data/provider/favorite/i_favorite_provider.dart';
import '../../data/provider/historic/historic_provider.dart';
import '../../data/provider/historic/i_historic_provider.dart';
import '../../data/provider/word/i_word_provider.dart';
import '../../data/provider/word/word_provider.dart';
import '../../data/repository/favorite/favorite_repository.dart';
import '../../data/repository/favorite/i_favorite_repository.dart';
import '../../data/repository/historic/historic_repository.dart';
import '../../data/repository/historic/i_historic_repository.dart';
import '../../data/repository/word/i_word_repository.dart';
import '../../data/repository/word/word_repository.dart';
import '../adapters/http_adapter/http/http_adapter.dart';
import '../adapters/http_adapter/http/i_http_adapter.dart';

class ApplicationBinding implements Bindings {
  @override
  dependencies() {
    Get.lazyPut<IHttpAdapter>(
      () => HttpAdapter(),
      fenix: true,
    );

    Get.lazyPut<IHistoricProvider>(
      () => HistoricProvider(
        http: Get.find<IHttpAdapter>(),
      ),
      fenix: true,
    );
    Get.lazyPut<IHistoricRepository>(
      () => HistoricRepository(
        provider: Get.find<IHistoricProvider>(),
      ),
      fenix: true,
    );

    Get.lazyPut<IFavoriteProvider>(
      () => FavoriteProvider(),
      fenix: true,
    );
    Get.lazyPut<IFavoriteRepository>(
      () => FavoriteRepository(
        provider: Get.find<IFavoriteProvider>(),
      ),
      fenix: true,
    );

    Get.lazyPut<IWordProvider>(
      () => WordProvider(
        http: Get.find<IHttpAdapter>(),
      ),
      fenix: true,
    );
    Get.lazyPut<IWordRepository>(
      () => WordRepository(
        provider: Get.find<IWordProvider>(),
      ),
      fenix: true,
    );
  }
}
