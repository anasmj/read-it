import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:pattern_m/src/db/isar.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/file.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/view/pdf.detail.dart';
import 'package:pattern_m/src/modules/setting/model/opened.file.detail.dart';
import '../provider/provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
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
    final file = File(pickedPlatformFile.path!);
    final filePath = file.path;
    final savedFile =
        await db.openedFileDetails.filter().idEqualTo(1).findFirst();
    final savedFilePath = savedFile?.path;
    print('uploaded file path $filePath');
    print('saved              $savedFilePath');

    print(filePath.trim() == savedFilePath?.trim());

    // final savedFile = await db.openedFileDetails.get(1);
    // print('saved file path    ${savedFile.first.path}');
  }
  // _onPickFile(BuildContext context, WidgetRef ref) async {
  //   if (!Platform.isAndroid) return;
  //   final pickedPlatformFile = await pickPDF();
  //   if (pickedPlatformFile == null) return;
  //   final pickedFile = File(pickedPlatformFile.path!);

  //   ref.read(fileProvider.notifier).update = pickedFile;
  //   await updateDB(pickedFile);

  //   if (!context.mounted) return;
  //   context.push(const PdfDetail());
  //   if (!context.mounted) return;
  // }
}
