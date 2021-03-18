import 'dart:convert';
import 'package:supplierapp/utils/network.dart';

var errors;
final _URL = 'http://127.0.0.1:8000/api/parameters';

Future<List<dynamic>> getParameter(String parameter) async {
  //Api address
  Network networkMgr = new Network(_URL);

  // Prepare data
  String apiURL = '/parameter';
  Map data = {'parameter': parameter};

  // Send request
  var response = await networkMgr.postRequest(data, apiURL);
  var body = json.decode(response.body);
  print(body);

  // Return errors
  if (body['success']) {
    return body['value'];
  } else {
    return null;
  }
}
