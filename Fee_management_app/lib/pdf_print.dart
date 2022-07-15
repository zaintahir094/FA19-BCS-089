import 'dart:html';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

Widget pdfView() => FutureBuilder<PDFDocument>(
  // Open document
  future: PDFDocument.openAsset('assets/sample.pdf'),
  builder: (_, snapshot) {
    if (snapshot.hasData) {
      // Show document
      return PDFView(document: snapshot.data);
    }

    if (snapshot.hasError) {
      // Catch
      return Center(
        child: Text(
          'PDF Rendering does not '
              'support on the system of this version',
        ),
      );
    }

    return Center(child: CircularProgressIndicator());
  },
);

class PDFView {
}

class CircularProgressIndicator {
}

class Center {
}

class PDFDocument {
  static openAsset(String s) {}
}