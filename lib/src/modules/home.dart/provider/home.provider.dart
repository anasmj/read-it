import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pattern_m/src/db/isar.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/home.dart/models/opened.file.detail.dart';

final recentFilesProvider = StreamProvider<List<RecentFile>>((ref) {
  return db.recentFiles.watchLazy(fireImmediately: true).asyncMap((_) async {
    return await db.recentFiles.where().findAll();
  });
});

Future<PlatformFile?> pickPDF() async {
  var result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  return result?.files.firstOrNull;
}

Future updateDB(File file) async {
  final fileName = file.path.getLast('/');
  final savedFile =
      await db.recentFiles.filter().pathEndsWith(fileName).findFirst();
  if (savedFile != null) {
    ///Update last open time
    await db.writeTxn(() async {
      await db.recentFiles.put(
        savedFile..lastOpen = DateTime.now(),
      ); // Insertion & modification
    });
  } else {
    //insert as new
    await db.writeTxn(
      () async {
        await db.recentFiles.put(
          RecentFile(
            path: file.path.trim(),
            lastOpen: DateTime.now(),
            isLastOpened: true,
            // fileData: await file.readAsBytes(),
          ),
        );
      },
    );
  }
}
