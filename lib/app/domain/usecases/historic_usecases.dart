import '../../data/repository/historic/i_historic_repository.dart';
import '../entities/historic_entity.dart';

abstract class HistoricUsecases {
  static Future<void> store({
    required IHistoricRepository iHistoricRepository,
    required HistoricEntity historic,
  }) async {
    return await iHistoricRepository.store(historic);
  }

  static Future<List<HistoricEntity>> getHistoric({
    required IHistoricRepository iHistoricRepository,
  }) async {
    return await iHistoricRepository.getHistoric();
  }
}
