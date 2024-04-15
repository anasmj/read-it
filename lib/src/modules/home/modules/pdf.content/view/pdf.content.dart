import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home/modules/pdf.content/model/tappable.text.dart';
import 'package:pattern_m/src/modules/home/modules/pdf.content/provider/meaning.provider.dart';
import 'package:pattern_m/src/modules/home/provider/home.provider.dart';

class PdfContent extends ConsumerWidget {
  const PdfContent({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final plainText = ref.watch(pdfProvider).text;
    final meaning = ref.watch(meaningProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            key: ValueKey(meaning?.word),
            meaning?.word ?? '',
            style: context.text.headlineMedium,
          ),
        ),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: TappableText(
              data: plainText ?? '',
              onTap: ref.read(meaningProvider.notifier).getMeaning,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
