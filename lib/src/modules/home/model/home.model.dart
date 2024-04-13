// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pdf_text/pdf_text.dart';

class PdfModel {
  PDFDoc? pdfDoc;
  String? text;
  int? currentPage;
  PdfModel({
    this.pdfDoc,
    this.text,
    this.currentPage,
  });

  PdfModel copyWith({
    PDFDoc? pdfDoc,
    String? text,
    int? currentPage,
  }) {
    return PdfModel(
      pdfDoc: pdfDoc ?? this.pdfDoc,
      text: text ?? this.text,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
