import 'package:flutter/services.dart';
import 'package:pattern_m/src/modules/dictionary/model/dictionary.dart';

late Dictionary e2bDictionary;

Future<void> initDictionary() async {
  final jsonResponse =
      await rootBundle.loadString('assets/dictionary/E2Bdatabase.json');
  e2bDictionary = Dictionary.fromJson(jsonResponse);
}
