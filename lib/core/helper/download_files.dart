import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadAnyFile({required String url}) async {
  final fileName = url.split('/').last;
  final file = await downloadFile(url: url, fileName: fileName);
  if (file == null) return;

  print('File path: ${file.path}');
  await OpenFile.open(file.path);
}

Future<File?> downloadFile({
  required String url,
  required String fileName,
}) async {
  try {
    final path = await getApplicationDocumentsDirectory();
    final file = File('${path.path}/$fileName');

    final response = await Dio().get<List<int>>(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: true,
        receiveTimeout: Duration(seconds: 60), // 60 ثانية
      ),
    );

    await file.writeAsBytes(response.data!);
    return file;
  } catch (e) {
    print('Error downloading file: $e');
    return null;
  }
}
