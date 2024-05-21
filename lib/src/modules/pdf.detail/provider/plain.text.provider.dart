import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/file.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/page.num.provider.dart';
import 'package:pdf_text/pdf_text.dart';

final plainTextProvier =
    AsyncNotifierProvider<PlainText, String?>(PlainText.new);

class PlainText extends AsyncNotifier<String?> {
  @override
  FutureOr<String?> build() async {
    final file = ref.watch(fileProvider);
    final currentPage = ref.watch(pageNumberProvider);
    if (file == null) return null;

    final pdfDoc = await PDFDoc.fromPath(file.path);

    return await pdfDoc.pageAt(currentPage + 1).text;
  }
}
