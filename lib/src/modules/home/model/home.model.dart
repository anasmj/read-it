// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:pdf_text/pdf_text.dart';

class PdfModel {
  PDFDoc? pdfDoc;
  List<String>? content;
  int? currentPage;
  PdfModel({
    this.pdfDoc,
    this.content,
    this.currentPage,
  });

  PdfModel copyWith({
    PDFDoc? pdfDoc,
    List<String>? content,
    int? currentPage,
  }) {
    return PdfModel(
      pdfDoc: pdfDoc ?? this.pdfDoc,
      content: content ?? this.content,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  
  @override
  bool operator ==(covariant PdfModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.pdfDoc == pdfDoc &&
      listEquals(other.content, content) &&
      other.currentPage == currentPage;
  }

  @override
  int get hashCode => pdfDoc.hashCode ^ content.hashCode ^ currentPage.hashCode;
}
