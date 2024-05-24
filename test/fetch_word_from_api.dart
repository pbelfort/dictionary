import 'dart:io';
import 'package:dictionary/app/base/adapters/http_adapter/http/http_adapter.dart';
import 'package:dictionary/app/base/shared/application_env.dart';
import 'package:dictionary/app/data/model/word_model.dart';
import 'package:dictionary/app/domain/entities/word_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final httpAdapter = HttpAdapter();
  setUpAll(() {
    HttpOverrides.global = null;
  });

  group(
    'test fetch and manipulate word',
    () {
      test(
        'get word from api',
        () async {
          final response = await httpAdapter.get(
            uri: '${AppEnvironment.baseUrl}/word',
            headers: null,
          );

          assert(response.body != null);

          final wordEntity = WordModel.fromJson(response.body);

          expect(wordEntity, isA<WordEntity>());
          expect(wordEntity.word, equals('word'));
        },
      );

      test(
        'test word has no phonetic audio',
        () async {
          final response = await httpAdapter.get(
            uri: '${AppEnvironment.baseUrl}/center',
            headers: null,
          );

          assert(response.body != null);

          final wordEntity = WordModel.fromJson(response.body);

          expect(
            wordEntity.phonetics.any((phonetic) => phonetic.audio.isEmpty),
            true,
          );
        },
      );

      test(
        'test word has phonetic audio',
        () async {
          final response = await httpAdapter.get(
            uri: '${AppEnvironment.baseUrl}/folder',
            headers: null,
          );

          assert(response.body != null);

          final wordEntity = WordModel.fromJson(response.body);

          expect(
            wordEntity.phonetics.any((phonetic) => phonetic.audio.isNotEmpty),
            true,
          );
        },
      );
    },
  );
}
