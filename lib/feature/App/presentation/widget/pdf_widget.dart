import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/extension/context_extension.dart';
import 'package:solution_challenge_2023_recommender_app/core/constants/material3/material3_desing_constant.dart';

class PdfWidget extends StatelessWidget {
  PdfWidget({super.key, required this.file});
  File file;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return InkWell(
      onTap: () async {
        if (file.existsSync()) {
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
        } else {
          final ref = FirebaseStorage.instance.refFromURL(file.path);

          final Directory tempDir = await getTemporaryDirectory();
          final File newfile = File('${tempDir.path}/${ref.name}');

          await ref.writeToFile(newfile).then((p0) async {
            file = newfile;
          }).then((value) {
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
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side:  BorderSide(color: isDark ? Colors.white : Colors.black, width: 1.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'PDF: ${file.path.split('_').last}',
                    maxLines: 1, // Maksimum satır sayısı
                    overflow: TextOverflow.ellipsis, // Taşan metin için gösterilecek işaret
                    style: Material3Design.mediumText.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(Icons.arrow_forward), // İçinize açılacak ikon
              ],
            ),
          ),
        ),
      ),
    );
  }
}
