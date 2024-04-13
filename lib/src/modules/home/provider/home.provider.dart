import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf_text/pdf_text.dart';

import '../model/home.model.dart';

final textProvider = NotifierProvider<TextProvider, PdfModel>(TextProvider.new);

class TextProvider extends Notifier<PdfModel> {
  PDFDoc? pdfDoc;
  PDFDoc? get pdf => pdfDoc;
  @override
  PdfModel build() => PdfModel(currentPage: 1);
  Future pickPDF() async {
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    final pickedFile = result?.files.firstOrNull;
    if (pickedFile == null) return;
    pdfDoc = await PDFDoc.fromPath(result!.files.single.path!);
    if (pdfDoc == null) return;
    String text = await pdfDoc!.pageAt(state.currentPage!).text;
    state = state.copyWith(
      pdfDoc: pdfDoc,
      content: text.split(' '),
    );
  }

  Future<void> onNext() async {
    final updatePage = state.currentPage! + 1;
    await updatePagecontent(updatePage);
  }

  Future<void> onPrev() async {
    if (state.currentPage! - 1 < 1) return;
    final updatePage = state.currentPage! + 1;
    await updatePagecontent(updatePage);
  }

  Future updatePagecontent(int page) async {
    final nextPageContents = await pdfDoc!.pageAt(page).text;
    state = state.copyWith(
      content: nextPageContents.split(' '),
      currentPage: page,
    );
  }
}
