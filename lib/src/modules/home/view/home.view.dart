import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/drawer/app.drawer.dart';
import 'package:pattern_m/src/modules/home/provider/home.provider.dart';
import 'package:pattern_m/src/modules/home/view/component/empty.view.dart';

import 'component/content.view.dart';
import 'component/pdf.view.dart';

final PageController _controller = PageController(initialPage: 0);

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final currentPage = ref.watch(pdfProvider).currentPage!;
    final notifier = ref.read(pdfProvider.notifier);
    final file = ref.watch(pdfProvider).pdfFile;
    final data = ref.watch(pdfProvider);
    final len = data.pdfDoc?.length ?? 0;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        actions: ref.watch(pdfProvider).pdfDoc != null
            ? [
                Text('$currentPage of $len', style: context.text.titleLarge),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: notifier.onPrev,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: notifier.onNext,
                ),
              ]
            : [],
      ),
      body: file != null
          ? PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: const [
                ContentView(),
                PdfViewWidget(),
              ],
            )
          : const EmptyView(),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(pdfProvider.notifier).pickPDF,
        child: const Icon(Icons.upload),
      ),
    );
  }
}
