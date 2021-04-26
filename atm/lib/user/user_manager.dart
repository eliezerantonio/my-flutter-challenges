import 'dart:convert';

import 'package:atm/helpers/api_response.dart';
import 'package:atm/helpers/const.dart';
import 'package:atm/helpers/prefs.dart';
import 'package:atm/user/user.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class UserManager extends ChangeNotifier {
  UserManager() {
    getUser();
  }
  User user;
  Future<ApiResponse<User>> login(String email, String password) async {
    try {
      var url = '$BASE_URL/client/login';
      Map<String, String> headers = {"Content-type": "application/json"};

      Map params = {
        'email': email,
        'password': password,
      };

      String credencials = jsonEncode(params);

      var response = await http.post(url, body: credencials, headers: headers);

      Map mapRensponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final client = User.fromJSON(mapRensponse);
        client.save();
        notifyListeners();
        return ApiResponse.ok(client);
      }
      notifyListeners();
      return ApiResponse.error(mapRensponse["message"]);
    } catch (e) {
      print(
        "Erro no login $e",
      );
      notifyListeners();
      return ApiResponse.error("Impossivel fazer login");
    }
  }

  Future<User> getUser() async {
    String jsonS = await Prefs.getString("client.prefs");

    // convertendo String para Map/Objecto
    Map map = json.decode(jsonS);

    user = User.fromJSONLocal(map);
    return user;
  }
}
