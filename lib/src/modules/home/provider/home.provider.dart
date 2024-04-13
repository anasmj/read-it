import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/utils/log/log.dart';
import 'package:pdf_text/pdf_text.dart';

final textProvider =
    NotifierProvider<TextProvider, List<String>>(TextProvider.new);

class TextProvider extends Notifier<List<String>> {
  @override
  List<String> build() => [];
  set setValue(String? s) => state = s!.split(' ');
  Future pickPDFText() async {
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    final pickedFile = result?.files.firstOrNull;
    if (pickedFile == null) return;
    final file = File(pickedFile.path!);
    final bytes = await file.readAsBytes();
    try {
      final pdfDoc = await PDFDoc.fromPath(result!.files.single.path!);

      String text = await pdfDoc.pageAt(1).text;
      print('text $text');
      state = text.split(' ');
    } catch (e) {
      log.d(e);
    }
  }
}
