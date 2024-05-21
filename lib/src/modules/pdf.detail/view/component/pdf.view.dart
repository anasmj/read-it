import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/file.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/page.num.provider.dart';
import 'package:pattern_m/src/theme/model/theme.model.dart';
import 'package:pattern_m/src/theme/provider/theme.provider.dart';

class PdfViewWidget extends ConsumerWidget {
  const PdfViewWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.watch(pageNumberProvider.notifier);
    return SizedBox.expand(
      child: PDFView(
        filePath: ref.watch(fileProvider)!.path,
        defaultPage: ref.watch(pageNumberProvider),
        enableSwipe: true,
        nightMode: ref.watch(themeProvider) == ThemeProfile.dark,
        onPageChanged: (page, pageCount) => notifier.setPage(page!),
      ),
    );
  }
}
