import '../../../domain/entities/word_entity.dart';
import '../../provider/word/i_word_provider.dart';
import 'i_word_repository.dart';

class WordRepository implements IWordRepository {
  final IWordProvider provider;
  WordRepository({required this.provider});

  @override
  Future<WordEntity?> getWordAttributes(String word) async {
    final response = await provider.getWordAttributesFromApi(word);
    return response;
  }
}
