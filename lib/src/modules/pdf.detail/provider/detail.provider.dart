import 'dart:io';

import 'package:isar/isar.dart';
import 'package:pattern_m/src/db/isar.dart';
import 'package:pattern_m/src/modules/home.dart/models/opened.file.detail.dart';
import 'package:pdf_text/pdf_text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail.provider.g.dart';

final usersStreamProvider = StreamProvider<List<OpenedFileDetail>>((ref) {
  return db.openedFileDetails.watchLazy(fireImmediately: true).asyncMap((_) async {
    return await db.openedFileDetails.where().findAll();
  });
});

@Riverpod(keepAlive: true)
class SelectedPDF extends _$SelectedPDF {
  @override
  File? build() => null;

  set update(File doc) => state = doc;
}

@riverpod
class Loading extends _$Loading {
  @override
  bool build() => false;
  set isLoading(bool b) => state = b;
}

enum Mode { normal, assist }

@riverpod
class ReadMode extends _$ReadMode {
  @override
  Mode build() => Mode.normal;
  void toggleMode() => state = state == Mode.assist ? Mode.normal : Mode.assist;
}

@riverpod
class PageNum extends _$PageNum {
  @override
  int build() => 0;

  void next() => state = state + 1;
  void previous() => state = state < 1 ? state - 1 : state;
  void setPage(int pageNo) => state = pageNo;
}

@riverpod
class PlainText extends _$PlainText {
  @override
  FutureOr<String?> build() async {
    final file = ref.watch(selectedPDFProvider);
    final currentPage = ref.watch(pageNumProvider);
    if (file == null) return null;

    final pdfDoc = await PDFDoc.fromPath(file.path);

    return await pdfDoc.pageAt(currentPage + 1).text;
  }
}
