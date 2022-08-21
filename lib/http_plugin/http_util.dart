import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:http_parser/http_parser.dart';

void uploadFileByBytes(String filePath) async {
//Step 1:- Create MultiPartRequest Instance

  http.MultipartRequest multipartRequest =
      http.MultipartRequest('POST', Uri.parse('BaseUrl + path'));

  //Step 2 :- Create MultiPartFile instance

  List<int> fileBytes = File(filePath).readAsBytesSync();

  var parameters = <String, String>{'user_id': "asfd", 'dummy': 'dummy'};

  http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
    'profile_pic',
    fileBytes,
    filename: File(filePath).path.split('/').last,
    contentType: MediaType('application', 'octet-stream', parameters),
  );

  //Step 3 :- Add MultipartFiles to MultiPartRequest

  multipartRequest.files.add(multipartFile);

  //Step 4:- Send MultipartFile

  multipartRequest.send().then((value) => null);
}

void uploadFileByConstructor(String filePath) async {
  File imageFile = File(filePath);
//Step 1:-
  http.MultipartRequest request =
      http.MultipartRequest('POST', Uri.parse('you_url'));

  Map<String, String> headers = {
    "Accept": "application/json",
    "Authorization": "Bearer " + 'Token'
  };

  request.headers.addAll(headers);

  int length = await imageFile.length();

  var byteStream = http.ByteStream(imageFile.openRead());

  // Prepare Multipart file instance.
  /*
  
  */

  http.MultipartFile multipartFile =
      http.MultipartFile('profile_pic', byteStream, length);

  //Last

  multipartFile = await http.MultipartFile.fromPath('profile_pic', filePath);

  request.files.add(multipartFile);

  request.send().then((value) => print(value));
}

void uploadFileByPath(String filePath) async {
  File imageFile = File(filePath);
//Step 1:-
  http.MultipartRequest request =
      http.MultipartRequest('POST', Uri.parse('you_url'));

  Map<String, String> headers = {
    "Accept": "application/json",
    "Authorization": "Bearer " + 'Your_Token'
  };

  request.headers.addAll(headers);

  int length = await imageFile.length();

  var byteStream = http.ByteStream(imageFile.openRead());

  // Prepare Multipart file instance.
  /*
  
  */

  http.MultipartFile multipartFile =
      http.MultipartFile('profile_pic', byteStream, length);

  //Last

  multipartFile = await http.MultipartFile.fromPath('profile_pic', filePath);

  request.files.add(multipartFile);

  request.send().then((value) => print(value));
}
