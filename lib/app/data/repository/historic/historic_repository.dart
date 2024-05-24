import '../../../domain/entities/historic_entity.dart';
import '../../provider/historic/i_historic_provider.dart';
import 'i_historic_repository.dart';

class HistoricRepository implements IHistoricRepository {
  final IHistoricProvider provider;

  HistoricRepository({required this.provider});

  @override
  Future<void> store(HistoricEntity historicEntity) async {
    final response = await provider.store(historicEntity);
    return response;
  }

  @override
  Future<List<HistoricEntity>> getHistoric() async {
    final response = await provider.getHistoric();
    return response;
  }
}
