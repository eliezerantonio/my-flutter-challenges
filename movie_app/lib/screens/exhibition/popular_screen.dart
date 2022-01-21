// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nicolau/bloc_navigation/bloc_navigation.dart';

import 'package:nicolau/providers/movie_provider.dart';

import 'package:nicolau/shared/widgets/sttaggered_grid_view_movie.dart';

import 'package:provider/provider.dart';

class PopularScreen extends StatefulWidget with NavigationStates {
  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        context.read<MoviesProvider>().getPopulares();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final populares = context.watch<MoviesProvider>().populares;
    return StaggeredGridViewMovie(
        scrollController: _scrollController, movies: populares);
  }
}
