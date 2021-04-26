import 'dart:convert';
import 'package:atm/helpers/const.dart';
import 'package:http/http.dart' as http;

import 'package:atm/account/account.dart';
import 'package:atm/helpers/api_response.dart';
import 'package:flutter/widgets.dart';

class AccountManager extends ChangeNotifier {
  Account account = Account();
  AccountManager() {
    getAccount();
  }

  Future<ApiResponse<Account>> getAccount({int userId}) async {
    try {
      var url = '$BASE_URL/account/$userId';
      Map<String, String> headers = {"Content-type": "application/json"};

      var response = await http.get(url, headers: headers);

      Map mapRensponse = json.decode(response.body);

      if (response.statusCode == 200) {
        account = Account.fromJson(mapRensponse);

        print(account);
        notifyListeners();
        return ApiResponse.ok(account);
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
}
