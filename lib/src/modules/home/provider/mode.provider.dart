import 'package:riverpod_annotation/riverpod_annotation.dart';

final modeProvider = NotifierProvider<Mode, ReadMode>(Mode.new);

class Mode extends Notifier<ReadMode> {
  @override
  ReadMode build() => ReadMode.normal;
  void toggleMode() =>
      state = state == ReadMode.assist ? ReadMode.normal : ReadMode.assist;
}

enum ReadMode { normal, assist }
