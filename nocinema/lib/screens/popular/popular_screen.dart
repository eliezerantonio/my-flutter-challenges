// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nocinema/bloc_navigation/bloc_navigation.dart';
import 'package:nocinema/providers/movie_provider.dart';
import 'package:nocinema/shared/widgets/sttaggered_grid_view_movie.dart';

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
          _scrollController.position.maxScrollExtent - 900) {
        context.read<MoviesProvider>().getPopulares();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final populares = context.watch<MoviesProvider>().populares;
    return StaggeredGridViewMovie(
        scrollController: _scrollController, movies: populares);
  }
}
