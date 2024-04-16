import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/home/modules/pdf.content/model/word.meaning.dart';

final meaningProvider =
    NotifierProvider<MeaningProvider, WordMeaning?>(MeaningProvider.new);

class MeaningProvider extends Notifier<WordMeaning?> {
  @override
  WordMeaning? build() => WordMeaning();

  Future<void> getMeaning(String word) async {
    state = state?.copyWith(
      word: _removeSpecialCharacters(word),
      meanings: [word],
    );
  }

  String _removeSpecialCharacters(String word) {
    RegExp pattern = RegExp(r'^[^a-zA-Z0-9]+|[^a-zA-Z0-9]+$');
    return word.replaceAll(pattern, '');
  }
}
