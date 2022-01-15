import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nicolau/models/actor_model.dart';
import 'package:nicolau/models/movie_model.dart';

class MoviesProvider with ChangeNotifier {
  final String _apikey = 'f50f2a9733f4a09c546a75bd6a80e915';
  final String _url = 'api.themoviedb.org';
  final String _language = 'pt-PT';

  int _popularesPage = 0;
  bool _carregando = false;

  final List<Movie> _populares = [];

  Future<List<Movie>> getEnCine() async {
    final url = Uri.http(
      _url,
      '3/movie/now_playing',
      {'api_key': _apikey, 'language': _language},
    );

    return await _processarResposta(url);
  }

  Future<List<Movie>> getPopulares() async {
    if (_carregando) return []; //se esta carregando dados para

    _carregando = true;
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

    final resp = await _processarResposta(url);
    _populares.addAll(resp);

    _carregando = false;
    return resp;
  }

  ///r
  Future<List<Movie>> _processarResposta(Uri url) async {
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final movies = Movies.fromJsonList(decodeData['results']);
    return movies.items;
  }

  Future<List<Actor>> getCast(String movieID) async {
    final url = Uri.https(_url, '3/movie/$movieID/credits', {
      'api_key': _apikey,
      'language': _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = Cast.fromJsonList(decodedData['cast']);

    return cast.actores;
  }

  Future<List<Movie>> busarFilme(String query) async {
    final url = Uri.https(
      _url,
      '3/search/movie',
      {'api_key': _apikey, 'language': _language, 'query': query},
    );

    return await _processarResposta(url);
  }
}
