import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/home/modules/pdf.content/model/word.meaning.dart';

final meaningProvider =
    NotifierProvider<MeaningProvider, WordMeaning?>(MeaningProvider.new);

class MeaningProvider extends Notifier<WordMeaning?> {
  @override
  WordMeaning? build() => WordMeaning();

  Future<void> getMeaning(String word) async {
    state = state?.copyWith(word: word, meanings: [word]);
  }
}
