import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'word.dart';

class Dictionary {
  final List<Word> words;
  Dictionary({required this.words});

  Dictionary copyWith({List<Word>? words}) {
    return Dictionary(words: words ?? this.words);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'words': words.map((x) => x.toMap()).toList(),
    };
  }

  factory Dictionary.fromMap(Map<String, dynamic> map) {
    return Dictionary(
      words: (map['words'] as List).map((e) => Word.fromMap(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Dictionary.fromJson(String source) =>
      Dictionary.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Dictionary(words: $words)';

  @override
  bool operator ==(covariant Dictionary other) {
    if (identical(this, other)) return true;

    return listEquals(other.words, words);
  }

  @override
  int get hashCode => words.hashCode;
}
