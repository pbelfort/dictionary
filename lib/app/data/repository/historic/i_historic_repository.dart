import '../../../domain/entities/historic_entity.dart';

abstract class IHistoricRepository {
  Future<void> store(HistoricEntity historicEntity);
  Future<List<HistoricEntity>> getHistoric();
}
