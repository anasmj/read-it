import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home.dart/models/opened.file.detail.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/detail.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/view/pdf.detail.dart';

import '../../drawer/app.drawer.dart';
import '../provider/home.provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recently Opened',
              style: context.text.headlineSmall,
            ),
            Expanded(
              child: ref.watch(usersStreamProvider).when(
                    data: (recentFiles) {
                      return ListView(
                        children: List.generate(
                          recentFiles.length,
                          (index) {
                            final file = recentFiles[index];

                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: ListTile(
                                title: Text(file.path!.getLast('/')),
                                subtitle: Text('Opened: ${file.lastOpen}'),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    error: (e, s) => const Text('err'),
                    loading: () => const Text('Loading'),
                  ),
            ),
          ],
        ),
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

    ref.read(selectedPDFProvider.notifier).update = pickedFile;

    if (!context.mounted) return;
    context.push(const PdfDetail());
    if (!context.mounted) return;
  }
}

class FileContainer extends StatelessWidget {
  const FileContainer({super.key, required this.detail});
  final OpenedFileDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      child: Text(
        detail.path!.getLast('/'),
      ),
    );
  }
}
