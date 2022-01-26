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
  final filmesProvider = new MoviesProvider();

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
        future: filmesProvider.searchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snaphot) {
          if (snaphot.hasData) {
            final movies = snaphot.data;

            return ListView(
                physics: const BouncingScrollPhysics(),
                children: movies!.map(
                  (movie) {
                    return ListTile(
                      leading: FadeInImage(
                          placeholder: const AssetImage('assets/no-image.jpg'),
                          image: NetworkImage(movie.getPosterImg()),
                          width: 50.0,
                          fit: BoxFit.contain),
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
