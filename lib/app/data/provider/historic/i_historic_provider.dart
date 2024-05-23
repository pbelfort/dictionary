import '../../../domain/entities/historic_entity.dart';

abstract class IHistoricProvider {
  Future<void> store(HistoricEntity historicEntity);
  Future<List<HistoricEntity>> getHistoric();
}
