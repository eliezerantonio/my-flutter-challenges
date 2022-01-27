import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:nocinema/bloc_navigation/bloc_navigation.dart';
import 'package:nocinema/providers/movie_provider.dart';
import 'package:nocinema/shared/widgets/sttaggered_grid_view_movie.dart';

import 'package:provider/provider.dart';

class BrieflyScreen extends StatefulWidget with NavigationStates {
  @override
  State<BrieflyScreen> createState() => _BrieflyScreenState();
}

class _BrieflyScreenState extends State<BrieflyScreen> {
  final List<int> items = List.generate(200, (index) => index);
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 900) {
        context.read<MoviesProvider>().getBriefly();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final upcomings = context.watch<MoviesProvider>().upcomings;
    return StaggeredGridViewMovie(scrollController: _scrollController, movies: upcomings);
  }
}

