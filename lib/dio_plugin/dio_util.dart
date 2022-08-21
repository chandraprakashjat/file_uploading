import 'dart:io';

import 'package:dio/dio.dart';

void uploadFile(String filePath) async {
  final Dio dio = Dio()..options.baseUrl = 'your_base_url';

  //create Form Data object

  String fileName = filePath.split('/').last;

  FormData formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(filePath, filename: 'image.png'),
    'name': 'prakash',
    'id': 'test_id'
  });

  var response = await dio.post('/upload', data: formData);

  print(response.headers);
}
