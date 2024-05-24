import 'dart:convert';
import 'package:dictionary/app/domain/entities/historic_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../base/adapters/http_adapter/http/i_http_adapter.dart';
import '../../../base/adapters/shared_adapter/shared_preferences/shared_preferences_adapter.dart';
import '../../model/historic_model.dart';
import 'i_historic_provider.dart';

class HistoricProvider implements IHistoricProvider {
  final IHttpAdapter http;
  final SharedPreferencesAdapter prefsAdapter = SharedPreferencesAdapter();

  HistoricProvider({required this.http});

  @override
  Future<void> store(HistoricEntity historicEntity) async {
    final String? historicString = prefsAdapter.getString('historic_list');

    if (historicString != null) {
      final wordHistoricList = HistoricModel.decodeHistoricList(historicString);

      if (!wordHistoricList
          .any((stored) => stored.word == historicEntity.word)) {
        wordHistoricList.add(
          HistoricEntity(
            uuidUser: historicEntity.uuidUser,
            word: historicEntity.word,
            dateTime: historicEntity.dateTime,
          ),
        );
      } else {
        final duplicatedIndex = wordHistoricList.indexWhere(
            (favoritedItem) => favoritedItem.word == historicEntity.word);

        final updatedHistoricItem = HistoricEntity(
          uuidUser: historicEntity.uuidUser,
          word: historicEntity.word,
          dateTime: DateTime.now(),
        );

        wordHistoricList[duplicatedIndex] = updatedHistoricItem;
      }

      wordHistoricList.sort((a, b) {
        return b.dateTime.compareTo(
          a.dateTime,
        );
      });

      return await prefsAdapter.setString(
        'historic_list',
        json.encode(
          wordHistoricList
              .map<Map<String, dynamic>>(
                  (historic) => HistoricModel.fromEntity(historic).toJson())
              .toList(),
        ),
      );
    }

    List<HistoricEntity> list = [historicEntity];
    return await prefsAdapter.setString(
      'historic_list',
      json.encode(
        list
            .map<Map<String, dynamic>>(
                (historic) => HistoricModel.fromEntity(historic).toJson())
            .toList(),
      ),
    );
  }

  @override
  Future<List<HistoricEntity>> getHistoric() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? historicString = prefs.getString('historic_list');
    if (historicString == null) return [];

    return HistoricModel.decodeHistoricList(historicString);
  }
}
