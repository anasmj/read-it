import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final fileProvider =
    NotifierProvider<PDFDocProvider, File?>(PDFDocProvider.new);

class PDFDocProvider extends Notifier<File?> {
  @override
  File? build() => null;

  set update(File doc) => state = doc;
}
