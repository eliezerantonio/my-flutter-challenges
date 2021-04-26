import 'dart:convert' as convert;

import 'package:atm/helpers/prefs.dart';
import 'package:flutter/widgets.dart';

class Client extends ChangeNotifier {
  int id;
  String name;
  String genre;
  String email;
  String bi;
  DateTime birthDate;
  String phone;
  String token;
  Client();
  Client.fromJSON(Map<String, dynamic> fromJSON) {
    Map json = fromJSON["data"]["client"];
    this.id = json['id'];
    this.name = json["name"];
    this.bi = json["bi"];
    this.email = json["email"];
    this.genre = json["genre"];
    this.phone = json["phone"];
    this.token = fromJSON["data"]["token"];
    this.birthDate = DateTime.tryParse(json["birthDate"]);

  } 
  
  Client.fromJSONLocal(Map<String, dynamic> fromJSON) {
    this.id = fromJSON['id'];
    this.name = fromJSON["name"];
    this.bi = fromJSON["bi"];
    this.email = fromJSON["email"];
    this.genre = fromJSON["genre"];
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

  static Future<Client> get() async {
    String json = await Prefs.getString("client.prefs");

    // convertendo String para Map/Objecto
    Map map = convert.jsonDecode(json);

    Client client = Client.fromJSONLocal(map);
    return client;
  }

  @override
  String toString() {
    return "Client(idn: $id, name: $name, genre: $genre, email $email, bi: $bi, birthDate: $birthDate, phone: $phone, token: $token)";
  }
}
