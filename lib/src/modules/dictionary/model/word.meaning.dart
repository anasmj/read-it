import 'dart:convert';

class WordMeaning {
  final String en;
  final String bn;
  WordMeaning({
    required this.en,
    required this.bn,
  });

  WordMeaning copyWith({
    String? en,
    String? bn,
  }) {
    return WordMeaning(
      en: en ?? this.en,
      bn: bn ?? this.bn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'en': en,
      'bn': bn,
    };
  }

  factory WordMeaning.fromMap(Map<String, dynamic> map) {
    return WordMeaning(
      en: map['en'] as String,
      bn: map['bn'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WordMeaning.fromJson(String source) =>
      WordMeaning.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WordMeaning(en: $en, bn: $bn)';

  @override
  bool operator ==(covariant WordMeaning other) {
    if (identical(this, other)) return true;

    return other.en == en && other.bn == bn;
  }

  @override
  int get hashCode => en.hashCode ^ bn.hashCode;
}
