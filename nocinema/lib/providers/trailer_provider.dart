import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nocinema/models/trailer.dart';

const CHAVE = "AIzaSyBRmA7IrKxREizPrvVKFpSx6BIbcRgv_Fo";

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
              "&maxResults=20"
              "&key=$CHAVE"
              "&q=$pesquisa - Official Trailer",
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
