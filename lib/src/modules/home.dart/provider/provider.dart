import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';
import 'package:pattern_m/src/db/isar.dart';
import 'package:pattern_m/src/modules/setting/model/opened.file.detail.dart';

Future<PlatformFile?> pickPDF() async {
  var result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  return result?.files.firstOrNull;
}

Future updateDB(File file) async {
  final savedFile =
      await db.openedFileDetails.filter().pathEqualTo(file.path).findFirst();
  print(savedFile);
  // await db.writeTxn(
  //   () async {
  //     await db.openedFileDetails.put(
  //       OpenedFileDetail(
  //         path: file.path,
  //         lastOpen: DateTime.now(),
  //         isLastOpened: true,
  //         // fileData: await file.readAsBytes(),
  //       ),
  //     );
  //   },
  // );
}
