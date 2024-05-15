import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/components/tranparent.loading.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/drawer/app.drawer.dart';
import 'package:pattern_m/src/modules/home/provider/file.provider.dart';
import 'package:pattern_m/src/modules/home/provider/home.provider.dart';
import 'package:pattern_m/src/modules/home/provider/mode.provider.dart';
import 'package:pattern_m/src/modules/home/provider/page.num.provider.dart';
import 'package:pattern_m/src/modules/home/view/component/empty.view.dart';

import 'component/assist.page.dart';
import 'component/pdf.view.dart';

final PageController _controller = PageController(initialPage: 0);
late final String name;

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final currentPage = ref.watch(pageNumberProvider);
    final notifier = ref.read(pdfProvider.notifier);
    final file = ref.watch(fileProvider);
    final data = ref.watch(pdfProvider);
    final len = data.pdfDoc?.length ?? 0;
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        actions: ref.watch(fileProvider) != null
            ? [
                Text('$currentPage of $len', style: context.text.titleLarge),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: notifier.onPrev,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () async {
                    TransparentLoading.push(context);
                    await notifier.onNext();
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  },
                ),
                const _ToggleModeButton(),
              ]
            : [],
      ),
      body: file != null ? _PDFBody() : const EmptyBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!Platform.isAndroid) return;
          final pickedFile = await _pickPDF();
          if (pickedFile == null) return;
          ref.read(fileProvider.notifier).update = File(pickedFile.path!);
          if (!context.mounted) return;
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}

Future<PlatformFile?> _pickPDF() async {
  var result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  return result?.files.firstOrNull;
}

class _PDFBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readMode = ref.watch(modeProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: readMode == ReadMode.normal
          ? const PdfViewWidget()
          : const AssistView(),
      // : const PdfContent(),
    );
  }
}

class _ToggleModeButton extends ConsumerWidget {
  const _ToggleModeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(modeProvider);
    final notifier = ref.watch(modeProvider.notifier);

    return TextButton(
      onPressed: notifier.toggleMode,
      child: Text(mode == ReadMode.normal ? 'Assist' : 'Normal'),
    );
  }
}
