import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'word.meaning.dart';

class Dictionary {
  final List<WordMeaning> words;
  Dictionary({required this.words});

  Dictionary copyWith({List<WordMeaning>? words}) {
    return Dictionary(words: words ?? this.words);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'words': words.map((x) => x.toMap()).toList(),
    };
  }

  factory Dictionary.fromMap(Map<String, dynamic> map) {
    return Dictionary(
      words: (map['words'] as List).map((e) => WordMeaning.fromMap(e)).toList(),
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
