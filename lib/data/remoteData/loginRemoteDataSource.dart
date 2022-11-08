import 'dart:convert';

import 'package:gallery_technical/constants/strings.dart';

import '../models/Images.dart';
import '../models/Login.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static String userToken = "";
  Future<Login?> loginUser(String email, String password) async {
    var request = http.MultipartRequest('POST', Uri.parse(loginUrl));
    request.fields.addAll({'email': email, 'password': password});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = (await response.stream.bytesToString());
      var loginData = Login.fromJson(jsonDecode(data));
      userToken = loginData.token ?? '';
      return loginData;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<Image?> getIImages() async {
    var headers = {'Authorization': 'Bearer $userToken'};
    var request = http.Request('GET', Uri.parse(getGallery));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = (await response.stream.bytesToString());
      var result = Image.fromJson(jsonDecode(data));
      print(result.data!.images);
      return result;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future uploadImage(String path) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://technichal.prominaagency.com/api/upload'));
    request.files.add(await http.MultipartFile.fromPath('img', path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
