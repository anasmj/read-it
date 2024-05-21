import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/file.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/view/pdf.detail.dart';

import '../../drawer/app.drawer.dart';
import '../provider/opened.files.provider.dart';
import '../provider/provider.dart';
import 'components/files.body.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: ref.watch(allOpenedFiles).when(
            //make sure file is not null here
            data: (files) => const FilesBody(),
            error: (e, s) => const Text('Error'),
            loading: () => const Text('Loading'),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await _onPickFile(context, ref),
        child: const Icon(Icons.upload),
      ),
    );
  }

  _onPickFile(BuildContext context, WidgetRef ref) async {
    if (!Platform.isAndroid) return;
    final pickedPlatformFile = await pickPDF();
    if (pickedPlatformFile == null) return;
    final pickedFile = File(pickedPlatformFile.path!);
    await updateDB(pickedFile);

    ref.read(fileProvider.notifier).update = pickedFile;

    if (!context.mounted) return;
    context.push(const PdfDetail());
    if (!context.mounted) return;
  }
}
