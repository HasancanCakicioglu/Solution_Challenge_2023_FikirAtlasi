import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfWidget extends StatelessWidget {
  const PdfWidget({super.key, required this.file});
  final File file;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFView(
              filePath: file.path,
              pageFling: true,
              pageSnap: true,
              enableSwipe: true,
              fitEachPage: true,
        
              fitPolicy: FitPolicy.BOTH,
              nightMode: Theme.of(context).brightness == Brightness.dark,

            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('PDF: ${path.basename(file.path)}'),
      ),
    );
  }
}
