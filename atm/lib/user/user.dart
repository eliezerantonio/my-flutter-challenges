import 'dart:convert' as convert;

import 'package:atm/helpers/const.dart';
import 'package:atm/helpers/prefs.dart';
import 'package:flutter/widgets.dart';

class User extends ChangeNotifier {
  int id;
  String name;
  String genre;
  String email;
  String bi;
  DateTime birthDate;
  String phone;
  String pic;
  String token;
  User();
  User.fromJSON(Map<String, dynamic> fromJSON) {
    Map json = fromJSON["data"]["client"];
    this.id = json['id'];
    this.name = json["name"];
    this.bi = json["bi"];
    this.email = json["email"];
    this.pic = json["pic"];
    this.genre = json["genre"];
    this.phone = json["phone"];
    this.token = fromJSON["data"]["token"];
    this.birthDate = DateTime.tryParse(json["birthDate"]);
  }

  User.fromJSONLocal(Map<String, dynamic> fromJSON) {
    this.id = fromJSON['id'];
    this.name = fromJSON["name"];
    this.bi = fromJSON["bi"];
    this.email = fromJSON["email"];
    this.genre = fromJSON["genre"];
    this.pic = fromJSON["pic"].toString().replaceAll("localhost", "$IP");
    this.phone = fromJSON["phone"];
    this.token = fromJSON["token"];
    //this.birthDate = DateTime.tryParse(fromJSON["birthDate"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["id"] = this.id;
    data["name"] = this.name;
    data["bi"] = this.bi;
    data["email"] = this.email;
    data["pic"] = this.pic;
    data["genre"] = this.genre;
    data["phone"] = this.phone;
    data["token"] = this.token;

    // data["birthDate"] = this.birthDate;

    return data;
  }

  void save() {
    Map map = toJson();
    //convertendo objecto/map para String
    //
    String json = convert.json.encode(map);

    Prefs.setString("client.prefs", json);
  }

  void clear() {
    Prefs.setString("client.prefs", "");
    notifyListeners();
  }

  @override
  String toString() {
    return "User(id: $id, name: $name, pic: $pic genre: $genre, email $email, bi: $bi, birthDate: $birthDate, phone: $phone, token: $token)";
  }
}
