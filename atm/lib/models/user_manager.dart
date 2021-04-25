import 'dart:convert';

import 'package:atm/helpers/api_response.dart';
import 'package:atm/models/client.dart';
import 'package:http/http.dart' as http;

class UserManager {
  static Future<ApiResponse<Client>> login(
      String email, String password) async {
    try {
      var url = 'http://172.20.10.4:3000/api/client/login';
      Map<String, String> headers = {"Content-type": "application/json"};
      Map params = {
        'email': email,
        'password': password,
      };

      String credencials = jsonEncode(params);

      var response = await http.post(url, body: credencials, headers: headers);
      print(response.body);
      Map mapRensponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final client = Client.fromJSON(mapRensponse);
        return ApiResponse.ok(client);
      }
      return ApiResponse.error(mapRensponse["message"]);
    } catch (e) {
      print(
        "Erro no login $e",
      );
      return ApiResponse.error("Impossivel fazer login");
    }
  }
}
