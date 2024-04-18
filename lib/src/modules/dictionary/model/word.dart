import 'dart:convert';

class Word {
  final String en;
  final String bn;
  Word({
    required this.en,
    required this.bn,
  });

  Word copyWith({
    String? en,
    String? bn,
  }) {
    return Word(
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

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      en: map['en'] as String,
      bn: map['bn'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Word.fromJson(String source) => Word.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Word(en: $en, bn: $bn)';

  @override
  bool operator ==(covariant Word other) {
    if (identical(this, other)) return true;
  
    return 
      other.en == en &&
      other.bn == bn;
  }

  @override
  int get hashCode => en.hashCode ^ bn.hashCode;
}