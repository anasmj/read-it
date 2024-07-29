import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pattern_m/src/modules/dictionary/api/e2b.dictionary.dart';
import 'package:pattern_m/src/modules/dictionary/model/word.meaning.dart';

final meaningProvider =
    NotifierProvider<MeaningProvider, WordMeaning?>(MeaningProvider.new);

class MeaningProvider extends Notifier<WordMeaning?> {
  @override
  WordMeaning? build() => null;

  Future<void> getMeaning(String word) async {
    final source = _removeSpecialCharacters(word);
    try {
      state = e2bDictionary.words.singleWhere((word) => word.en == source);
    } catch (e) {
      state = WordMeaning(en: source, bn: source);
    }
  }

  String _removeSpecialCharacters(String word) {
    RegExp pattern = RegExp(r'^[^a-zA-Z0-9]+|[^a-zA-Z0-9]+$');
    return word.replaceAll(pattern, '');
  }
}
