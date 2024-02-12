import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:solution_challenge_2023_recommender_app/core/constants/enums/firestore_constants.dart';


/// Extension for [File] class
/// 
/// This extension provides a mechanism for checking if a file is a pdf, image or video.
extension FileTypeExtension on File {
  FirestoreAllowedFileTypes get fileType {
    String extension = path.extension(this.path).toLowerCase();

    if (extension == '.jpg' || extension == '.jpeg' || extension == '.png') {
      return FirestoreAllowedFileTypes.image;
    } else if (extension == '.mp4' || extension == '.mov') {
      return FirestoreAllowedFileTypes.video;
    } else if (extension == '.pdf') {
      return FirestoreAllowedFileTypes.pdf;
    } else {
      return FirestoreAllowedFileTypes.unknown;
    }
  }
}

/// Extension for [List<File>] class
/// 
/// This extension provides a mechanism for checking if a file is an image.
extension ImageFileListExtension on List<File> {
  List<File> get onlyImages {
    return where((file) {
      String extension = path.extension(file.path).toLowerCase();
      return extension == '.jpg' || extension == '.jpeg' || extension == '.png';
    }).toList();
  }
}

/// Extension for [List<File>] class
/// 
/// This extension provides a mechanism for checking if a file is a pdf.
extension PdfFileListExtension on List<File> {
  List<File> get onlyPdfs {
    return where((file) {
      String extension = path.extension(file.path).toLowerCase();
      return extension == '.pdf';
    }).toList();
  }
}

/// Extension for [List<File>] class
/// 
/// This extension provides a mechanism for checking if a file is a video.
extension VideoFileListExtension on List<File> {
  List<File> get onlyVideos {
    return where((file) {
      String extension = path.extension(file.path).toLowerCase();
      return extension == '.mp4' || extension == '.mov';
    }).toList();
  }
}

/// Extension for [File] class
/// 
/// This extension provides a mechanism for checking if a file is an image.
extension ImageFileExtension on File {
  bool get isImage {
    String extension = path.extension(this.path).toLowerCase();
    return extension == '.jpg' || extension == '.jpeg' || extension == '.png';
  }
}