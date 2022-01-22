import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nicolau/models/actor_model.dart';
import 'package:nicolau/models/movie_model.dart';

class MoviesProvider with ChangeNotifier {
  MoviesProvider() {
    getEnCine();
    getPopulares();
    getBriefly();
  }
  final String _apikey = 'f50f2a9733f4a09c546a75bd6a80e915';
  final String _url = 'api.themoviedb.org';
  final String _language = 'pt-PT';

  int _popularesPage = 0;
  int _upcomingsPage = 0;

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<Movie> populares = [];
  List<Movie> now_playings = [];
  List<Movie> upcomings = [];
  List<Actor> actores = [];

  Future<List<Movie>> getBriefly() async {
    loading = true;
    _upcomingsPage++;
    final url = Uri.http(
      _url,
      '3/movie/upcoming',
      {
        'api_key': _apikey,
        'language': _language,
        'page': _upcomingsPage.toString(),
      },
    );

    final resp = await _proccessResponse(url);
    upcomings.addAll(resp);
    loading = false;
    return resp;
  }

  Future<List<Movie>> getEnCine() async {
    loading = true;
    final url = Uri.http(
      _url,
      '3/movie/now_playing',
      {
        'api_key': _apikey,
        'language': _language,
      },
    );

    final resp = await _proccessResponse(url);
    now_playings.addAll(resp);
    loading = false;
    return resp;
  }

  Future<List<Movie>> getPopulares() async {
    loading = true;
    _popularesPage++;

    final url = Uri.https(
      _url,
      '3/movie/popular',
      {
        'api_key': _apikey,
        'language': _language,
        'page': _popularesPage.toString()
      },
    );

    final resp = await _proccessResponse(url);
    populares.addAll(resp);

    loading = false;
    return resp;
  }

  ///r
  Future<List<Movie>> _proccessResponse(Uri url) async {
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodeData['results']);
    return movies.items;
  }

  Future<void> getCast(String movieID) async {
    actores.clear();
    final url = Uri.https(_url, '3/movie/$movieID/credits', {
      'api_key': _apikey,
      'language': _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = Cast.fromJsonList(decodedData['cast']);
    actores.addAll(cast.actores);
    notifyListeners();
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(
      _url,
      '3/search/movie',
      {'api_key': _apikey, 'language': _language, 'query': query},
    );

    return await _proccessResponse(url);
  }
}
