import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/home/provider/home.provider.dart';
import 'package:pattern_m/src/theme/model/theme.model.dart';
import 'package:pattern_m/src/theme/provider/theme.provider.dart';

class PdfViewWidget extends ConsumerWidget {
  const PdfViewWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox.expand(
      child: PDFView(
        filePath: ref.watch(pdfProvider).pdfFile!.path,
        defaultPage: ref.watch(pdfProvider).currentPage! - 1,
        enableSwipe: false,
        nightMode: ref.watch(themeProvider) == ThemeProfile.dark,
      ),
    );
  }
}
