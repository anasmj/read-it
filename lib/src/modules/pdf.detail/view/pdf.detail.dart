import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/file.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/mode.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/page.num.provider.dart';

import 'component/assist.view.dart';
import 'component/pdf.view.dart';
import 'component/toggle.mode.button.dart';

class PdfDetail extends ConsumerWidget {
  const PdfDetail({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final currentPage = ref.watch(pageNumberProvider);
    final notifier = ref.read(pageNumberProvider.notifier);
    final readMode = ref.watch(modeProvider);

    return Scaffold(
      appBar: AppBar(
        actions: ref.watch(fileProvider) != null
            ? [
                Text('$currentPage ', style: context.text.titleLarge),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: notifier.previous,
                ),
                IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: notifier.next),
                const ToggleModeButton(),
              ]
            : [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: readMode == ReadMode.normal
            ? const PdfViewWidget()
            : const AssistView(),
        // : const PdfContent(),
      ),
    );
  }
}
