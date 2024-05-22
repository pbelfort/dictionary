import '../../../domain/entities/word_entity.dart';

abstract class IWordRepository {
  Future<WordEntity?> getWordAttributes(String word);
}
