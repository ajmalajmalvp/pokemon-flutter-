import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewer extends StatelessWidget {
  final String pdfUrl;

  PDFViewer(this.pdfUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfUrl,
      ),
    );
  }
}
