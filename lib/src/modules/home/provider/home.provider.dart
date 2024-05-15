import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/home/provider/loading.provider.dart';
import 'package:pdf_text/pdf_text.dart';

import 'page.num.provider.dart';

final pdfProvider = NotifierProvider<TextProvider, _PdfModel>(TextProvider.new);

class TextProvider extends Notifier<_PdfModel> {
  PDFDoc? pdfDoc;
  PDFDoc? get pdf => pdfDoc;
  String? content;
  @override
  _PdfModel build() => _PdfModel();
  int get currentPage => ref.watch(pageNumberProvider);
  Future pickPDF() async {
    if (!Platform.isAndroid) return;
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    final pickedFile = result?.files.firstOrNull;
    if (pickedFile == null) return;
    ref.invalidateSelf();
    ref.read(loadingProvider.notifier).isLoading = true;
    pdfDoc = await PDFDoc.fromPath(result!.files.single.path!);
    ref.read(loadingProvider.notifier).isLoading = false;
    if (pdfDoc == null) return;
    String text = await pdfDoc!.pageAt(currentPage + 1).text;
    state = state.copyWith(
      pdfDoc: pdfDoc,
      text: text,
      pdfFile: File(pickedFile.path!),
    );
  }

  Future<void> onNext() async {
    if (currentPage == state.pdfDoc!.length - 1) return;
    final updatePage = currentPage + 1;
    ref.read(loadingProvider.notifier).isLoading = true;
    await _updatePagecontent(updatePage);
    ref.read(loadingProvider.notifier).isLoading = false;
  }

  Future<void> onPrev() async {
    if (currentPage - 1 < 1) return;
    final updatePage = currentPage - 1;
    await _updatePagecontent(updatePage);
  }

  Future _updatePagecontent(int page) async {
    final nextPageContents = await pdfDoc!.pageAt(page).text;
    state = state.copyWith(
      text: nextPageContents,
      currentPage: page,
    );
  }
}

class _PdfModel {
  PDFDoc? pdfDoc;
  File? pdfFile;
  String? text;
  // int? currentPage;

  _PdfModel({
    this.pdfDoc,
    this.text,
    // this.currentPage,
    this.pdfFile,
  });

  _PdfModel copyWith({
    PDFDoc? pdfDoc,
    String? text,
    int? currentPage,
    File? pdfFile,
  }) {
    return _PdfModel(
      pdfDoc: pdfDoc ?? this.pdfDoc,
      text: text ?? this.text,
      // currentPage: currentPage ?? this.currentPage,
      pdfFile: pdfFile ?? this.pdfFile,
    );
  }
}
