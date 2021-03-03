import 'package:bfa_turismo/src/data/place_data.dart';
import 'package:bfa_turismo/src/models/place.dart';
import 'package:flutter/material.dart';

enum FilterOptions {
  Favorite,
  All,
}

class PlacesScreen extends StatefulWidget {
  PlacesScreen({Key key}) : super(key: key);

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final List<Place> loadPlaces = DUMMY_PLACES;
  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "images/logo.png",
          width: 100,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorite) {
                setState(() {
                  _showFavoriteOnly = true;
                });
              } else {
                setState(
                  () {
                    _showFavoriteOnly = false;
                  },
                );
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('favoritos'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: loadPlaces.length,
        itemBuilder: (context, i) => Text(loadPlaces[i].title),
      ),
    );
  }
}
