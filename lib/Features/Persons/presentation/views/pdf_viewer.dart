import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({super.key, required this.pdfUrl});
  final String pdfUrl;
  @override
  Widget build(BuildContext context) {
    return PDF(
      enableSwipe: true,
      autoSpacing: true,
      // swipeHorizontal: true,
      // pageFling: true,
    ).cachedFromUrl(
      pdfUrl,
      placeholder:
          (progress) =>
              Center(child: CircularProgressIndicator(value: progress / 100)),
      errorWidget: (error) => Center(child: Text(error.toString())),
    );
  }
}
