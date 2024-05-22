import '../../../domain/entities/word_entity.dart';

abstract class IWordProvider {
  Future<WordEntity?> getWordAttributesFromApi(String word);
  Future<void> favorite(String wordFavorited);
  Future<List<String>> getAllFavorites();
}
