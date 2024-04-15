import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/home/provider/loading.provider.dart';
import 'package:pdf_text/pdf_text.dart';

import '../model/home.model.dart';

final pdfProvider = NotifierProvider<TextProvider, PdfModel>(TextProvider.new);

class TextProvider extends Notifier<PdfModel> {
  PDFDoc? pdfDoc;
  PDFDoc? get pdf => pdfDoc;
  @override
  PdfModel build() => PdfModel(currentPage: 1);
  Future pickPDF() async {
    if (!Platform.isAndroid) return;
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    final pickedFile = result?.files.firstOrNull;
    if (pickedFile == null) return;
    ref.read(loadingProvider.notifier).isLoading = true;
    pdfDoc = await PDFDoc.fromPath(result!.files.single.path!);
    ref.read(loadingProvider.notifier).isLoading = false;
    if (pdfDoc == null) return;
    String text = await pdfDoc!.pageAt(state.currentPage!).text;
    state = state.copyWith(
      pdfDoc: pdfDoc,
      text: text,
      pdfFile: File(pickedFile.path!),
    );
  }

  Future<void> onNext() async {
    if (state.currentPage == state.pdfDoc!.length - 1) return;
    final updatePage = state.currentPage! + 1;
    ref.read(loadingProvider.notifier).isLoading = true;
    await updatePagecontent(updatePage);
    ref.read(loadingProvider.notifier).isLoading = false;
  }

  Future<void> onPrev() async {
    if (state.currentPage! - 1 < 1) return;
    final updatePage = state.currentPage! - 1;

    await updatePagecontent(updatePage);
  }

  Future updatePagecontent(int page) async {
    final nextPageContents = await pdfDoc!.pageAt(page).text;
    state = state.copyWith(
      text: nextPageContents,
      currentPage: page,
    );
  }
}
