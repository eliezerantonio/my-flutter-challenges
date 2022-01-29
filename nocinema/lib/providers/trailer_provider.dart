import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nocinema/models/trailer.dart';

const CHAVE = "AIzaSyDTgJndQ51CM7kkiRbpPuLRRSEkA0qZFiU";

const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class TrailerProvider with ChangeNotifier {
  final List<Video> trailers = [];
  Future<void> search(String pesquisa) async {
    trailers.clear();
    http.Response response = await http.get(Uri.parse(
      URL_BASE +
          "search"
              "?part=snippet"
              "&type=video"
              "&maxResults=1"
              "&order=date"
              "&key=$CHAVE"
              "&q=$pesquisa official trailer",
    ));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      trailers.addAll(videos);
      notifyListeners();
    }
  }
}
