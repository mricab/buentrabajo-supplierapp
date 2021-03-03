import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

// Debuggin on Android
// To correctly comunicate the Android Emulator with an API running on localhost
// use: adb reverse tcp:8000 tcp:8000
// Source: https://stackoverflow.com/questions/49855754/unable-to-make-calls-to-localhost-using-flutter-random-port-being-assigned-to-h?answertab=votes#tab-top

class Network {
  // Class propieties
  String _URL;
  var token;

  Network(String url) {
    _URL = url;
  }

  getRequest(String apiURL) async {
    var fullURL = _URL + apiURL;
    await _getToken();
    return await http.get(fullURL, headers: _headers());
  }

  postRequest(Map data, String apiURL) async {
    //Endpoint URL
    var fullURL = _URL + apiURL;

    //Send request
    return await http.post(fullURL,
        body: jsonEncode(data), headers: _headers());
  }

  postMultipartRequest(Map data, Map files, String apiURL) async {
    //Endpoint URL
    var fullURL = _URL + apiURL;

    //Multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(fullURL),
    );

    //Add headers to request
    request.headers.addAll(_multipartHeaders());

    //Add fields to request
    request.fields.addAll(Map<String, String>.from(data));

    //Add files to request
    files?.forEach((field, fieldData) {
      var path = fieldData[0];
      var type = fieldData[1];
      File f = new File(fieldData[0]);
      request.files.add(
        http.MultipartFile(field, f.readAsBytes().asStream(), f.lengthSync(),
            filename: basename(path),
            contentType: MediaType(type, extension(path))),
      );
    });

    //Send request
    var streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }

  // Helper methods
  _headers() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  _multipartHeaders() => {
        'Content-type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }
}
