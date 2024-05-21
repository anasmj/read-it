import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:pattern_m/src/db/isar.dart';
import 'package:pattern_m/src/modules/home.dart/models/opened.file.detail.dart';

final allOpenedFiles =
    AsyncNotifierProvider<OpenedFilesProvider, List<OpenedFileDetail>>(
        OpenedFilesProvider.new);

class OpenedFilesProvider extends AsyncNotifier<List<OpenedFileDetail>> {
  @override
  Future<List<OpenedFileDetail>> build() async {
    return db.openedFileDetails.where().findAll();
  }
}
