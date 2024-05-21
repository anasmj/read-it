import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/file.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/view/pdf.detail.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!Platform.isAndroid) return;
          final pickedFile = await _pickPDF();
          if (pickedFile == null) return;
          ref.read(fileProvider.notifier).update = File(pickedFile.path!);
          if (!context.mounted) return;
          context.push(const PdfDetail());
          if (!context.mounted) return;
        },
        child: const Icon(Icons.upload),
      ),
    );
  }

  Future<PlatformFile?> _pickPDF() async {
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    return result?.files.firstOrNull;
  }
}
