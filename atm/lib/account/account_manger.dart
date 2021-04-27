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

        notifyListeners();
        return ApiResponse.ok(account);
      }
      notifyListeners();
      return ApiResponse.error(mapRensponse["message"]);
    } catch (e) {
      print(
        "Erro no login $e",
      );
      return ApiResponse.error("Impossivel fazer login");
    }
  }

  Future<ApiResponse<Account>> sendMoney(
      {@required int currentAccount,
      @required sendAccount,
      @required num balance}) async {
    try {
      print(sendAccount);
      var url = '$BASE_URL/account/transfer/$currentAccount';
      Map<String, String> headers = {"Content-type": "application/json"};

      Map<String, dynamic> params = {"id": sendAccount, "balance": balance};

      String values = json.encode(params);

      var response = await http.patch(url, body: values, headers: headers);
      Map mapRensponse = json.decode(response.body);

      print(response.statusCode);
      if (response.statusCode == 200) {
        final account = Account.fromJson(mapRensponse);
        getAccount(userId: 1);
        notifyListeners();
        return ApiResponse.ok(account);
      }
      notifyListeners();
      return ApiResponse.error(mapRensponse["message"]);
    } catch (e) {
      print(
        "Erro no login $e",
      );
      return ApiResponse.error("$e");
    }
  }
}
