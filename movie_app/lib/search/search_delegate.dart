import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/providers/movie_provider.dart';
import 'package:nicolau/screens/movie_details/details_movie_screen.dart';

class DataSerach extends SearchDelegate {
  final filmes = [
    'SpiderMan',
    'Aquaman',
    'Batman',
    'Capitao america',
  ];
  final filmesRecentes = [
    'SpiderMan',
    'Capitao america',
  ];
  String selecao = '';
  final moviesProvider = MoviesProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    //limpar
    //acoes do noso app bar

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //voltar
    //icon a esquerda do appbar

    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //cria os resultado que vamos mostrar

    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(selecao),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: moviesProvider.searchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snaphot) {
          if (snaphot.hasData) {
            final movies = snaphot.data;

            return ListView(
                physics: const BouncingScrollPhysics(),
                children: movies!.map(
                  (movie) {
                    movie.uiniqueId = '${movie.id}-card';
                    return ListTile(
                      leading: Hero(
                        tag: movie.uiniqueId,
                        child: CachedNetworkImage(
                          width: 50,
                          imageUrl: movie.getPosterImg(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Image.asset(
                            "assets/no-image.jpg",
                            fit: BoxFit.cover,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(movie.title),
                      subtitle: Text(movie.originalTitle),
                      onTap: () {
                        close(context, null); //encerrar busca ao clspiicar

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsMovieScreen(
                              movie: movie,
                            ),
                          ),
                        );
                        movie.uiniqueId = '';
                      },
                    );
                  },
                ).toList());
          } else {
            return Center(
                child: CircularProgressIndicator(color: Colors.grey[800]));
          }
        },
      );
    }
  }

/*
  @override
  Widget buildSuggestions(BuildContext context) {
//mostrar sugoestpes ao escrever
    final listaSugerida = (query.isEmpty)
        ? filmesRecentes
        : filmes
            .where(
              (filme) => filme.toLowerCase().startsWith(query.toLowerCase()),
            )
            .toList();
    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listaSugerida[i]),
          onTap: () {
            selecao = listaSugerida[i];
            showResults(context);
          },
        );
      },
    );
  }*/
}
