import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  CarouselController _carouselController = new CarouselController();

  int _current = 0;

  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Image.network(_movies[_current]["image"], fit: BoxFit.cover),
              bottomGradiant(size),
              carouselSlider(context),
              buttonDarkMode()
            ],
          ),
        ),
      ),
    );
  }

  Positioned buttonDarkMode() {
    return Positioned(
      top: 0,
      right: 10,
      child: Switch(
        activeColor: Colors.white,
        inactiveThumbColor: Colors.black,
        value: darkMode,
        onChanged: (value) {
          setState(() {
            darkMode = value;
          });
        },
      ),
    );
  }

  Positioned bottomGradiant(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        height: size.height * 0.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: darkMode ? backgroundDarkMode : backgroundWhiteMode,
          ),
        ),
      ),
    );
  }

  Positioned carouselSlider(BuildContext context) {
    return Positioned(
      bottom: 0,
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        carouselController: _carouselController,
        options: CarouselOptions(
          height: 600.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.70,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: _movies.map((movie) => itemMovie(movie)).toList(),
      ),
    );
  }

  Builder itemMovie(movie) {
    return Builder(builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: darkMode ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: 300,
                child: Image.network(movie['image'], fit: BoxFit.cover),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: !darkMode ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                _movies[_current]["title"],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  color: !darkMode ? Colors.grey[850] : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  typeMovie("Action"),
                  const SizedBox(width: 7),
                  typeMovie("Drama"),
                  const SizedBox(width: 7),
                  typeMovie("History"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 18,
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.grey,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[850],
                  ),
                  onPressed: () {},
                  child: Text("BUY TICKET"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }

  final List<Color> backgroundDarkMode = [
    Colors.black.withOpacity(0.4),
    Colors.black.withOpacity(0.4),
    Colors.black.withOpacity(0.4),
    Colors.black.withOpacity(0.4),
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  final List<Color> backgroundWhiteMode = [
    Colors.grey.shade50.withOpacity(0.0),
    Colors.grey.shade50.withOpacity(0.0),
    Colors.grey.shade50.withOpacity(0.0),
    Colors.grey.shade50.withOpacity(0.0),
    Colors.grey.shade50.withOpacity(1),
    Colors.grey.shade50.withOpacity(1),
    Colors.grey.shade50.withOpacity(1),
    Colors.grey.shade50.withOpacity(1),
  ];
  final List<dynamic> _movies = [
    {
      'id': 1,
      'title': 'Spider-Man: No Way Home',
      'image':
          'https://www.moviepostersgallery.com/wp-content/uploads/2021/12/Spidermannowayhome2.jpg',
      'description': 'Spider-Man: No Way Home'
    },
    {
      'id': 2,
      'title': 'Black Widow',
      'image':
          'https://www.moviepostersgallery.com/wp-content/uploads/2020/08/Blackwidow2.jpg',
      'description': 'Black Widow'
    },
    {
      'id': 3,
      'title': 'The Matrix Resurrections',
      'image':
          'https://www.moviepostersgallery.com/wp-content/uploads/2021/12/Matrixresurrections1.jpg',
      'description': 'The Matrix Resurrections'
    },
    {
      'id': 4,
      'title': 'Shang-Chi and the Legend of the Ten Rings',
      'image':
          'https://www.moviepostersgallery.com/wp-content/uploads/2021/09/Shangchi5.jpg',
      'description': 'Shang-Chi and the Legend of the Ten Rings'
    },
  ];

  Container typeMovie(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 10, color: !darkMode ? Colors.grey[850] : Colors.white),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
