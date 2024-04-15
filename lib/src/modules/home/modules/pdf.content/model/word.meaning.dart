// ignore_for_file: public_member_api_docs, sort_constructors_first


class WordMeaning {
  String? word;

  List<String>? synonyme;
  List<String>? antonyme;
  List<String>? meanings;
  List<String>? examples;
  WordMeaning({
    this.word,
    this.synonyme,
    this.antonyme,
    this.meanings,
    this.examples,
  });

  WordMeaning copyWith({
    String? word,
    List<String>? synonyme,
    List<String>? antonyme,
    List<String>? meanings,
    List<String>? examples,
  }) {
    return WordMeaning(
      word: word ?? this.word,
      synonyme: synonyme ?? this.synonyme,
      antonyme: antonyme ?? this.antonyme,
      meanings: meanings ?? this.meanings,
      examples: examples ?? this.examples,
    );
  }
}
