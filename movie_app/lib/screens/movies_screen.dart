import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/screens/details_movie_screen.dart';

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
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (_, __, ___) => DetailsMovieScreen(
                movie: movie,
                darkMode: darkMode
              ),
            ),
          );
        },
        child: Container(
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
                  child: Hero(
                      tag: movie['id'],
                      child: Image.network(movie['image'], fit: BoxFit.cover)),
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
                  movie["title"],
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
      'diretor': 'Jon Watts',
      'actores': [
        'Tom Halland',
        'Zendaya',
        'Willem Dafoe',
        'Jamie Foxx',
        'Benedict Wong'
      ],
      'images': [
        'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcT2mdIv2oSgUO0zm7jZHboIgb1T7ligSAizsDiuDbOC94Dt8TZffj5WtNHFvoci',
        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTPp7UQ5G0rhPhv6YmpJaW_10JHbxI7sdzcYIEQGTrVPxhBcxV9',
        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRFYlQPvEXywuwkAHN4V9hucf0gflp0DURrHByQ9ijoDvb5ZzWw',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf6FGrcpWKJc-y8maa2E5u33sWL4KQXBV2FtNmaV9jfih5GJ0e',
        'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRhgeAN_W918Iv5fx1WeJMFiNwsePWLQNMq8yV2X-fR1uCxt-iWUVhd701ySYUj'
      ],
      'image':
          'https://www.moviepostersgallery.com/wp-content/uploads/2021/12/Spidermannowayhome2.jpg',
      'description': 'Spider-Man: No Way Home'
    },
    {
      'id': 2,
      'title': 'Black Widow',
      'diretor': 'Cate Shortland',
      'actores': [
        'Scarlett Johansson',
        'Florence Pugh',
        'Rachel Weisz',
        'David Harbour',
        'Olga Kurylenko'
      ],
      'images': [
        'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcR12u5Cc7lls-tDFSjb-j0ules8_c6lrXgXkDUkDgAaJbbB4Df28b-WEXGS-G3_',
        'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSmNt8UEaTX5t3kN4G0I8kQikhWdc0Aj1FbX6_9XlK9UOKjHaoCZRfz50AFO3jN',
        'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcSQNEbvHBIFFng3NAanlhlOfLlGkLuRWLsKNqhkpp3qy9gpTo_XkZt_pj9e0v3U',
        'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcSw-hcpWMQGl_wSd0y5riySoGZ19UUAaX7alKnkJoK6XEv6YVwBVtbc_HaLr5E4',
        'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQhD399rEwQSPP6VdbYUAxCA_G8Bd9j6qWKwzcNu4pivgAMiV7Y1OUYYSSNnq7a'
      ],
      'image':
          'https://www.moviepostersgallery.com/wp-content/uploads/2020/08/Blackwidow2.jpg',
      'description': 'Black Widow'
    },
    {
      'id': 3,
      'title': 'The Matrix Resurrections',
      'diretor': 'Lana Wachowski',
      'actores': [
        'Lana Wachowski',
        'Carrie-Anne Moss',
        'Priyanka Chopra',
        'Jessica Henwick',
        'Daniel Bernhardt'
      ],
      'images': [
        'http://t2.gstatic.com/licensed-image?q=tbn:ANd9GcRHpx4nrlQmqA83ImfeOvsRKcrB2NN15NHAvYWpBWobbDe0t8Fkza7gfUEX3GtA',
        'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcQowPUlZWy6FI3GG7mUhkgbcwd1bILfmgI9m-36EijHHeEDuyY-TvogECI7AAaZ',
        'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ9O5SB_crSVtojJYleoSjb70FrpRW6ZOC61P-77hsBcjOADMSt',
        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ9A34J_XmZAfxsgRqheKnaKutKP1iVH4BFCXx9rwL6xUthgC_f',
        'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcS3cr_WI7Ak6eOvjStCAKOn7dJC2pDSi-Q5uX07TSeTElfu7QHKVXCJC1IO3ImD'
      ],
      'image':
          'https://www.moviepostersgallery.com/wp-content/uploads/2021/12/Matrixresurrections1.jpg',
      'description': 'The Matrix Resurrections'
    },
    {
      'id': 4,
      'title': 'Shang-Chi and the Legend of the Ten Rings',
      'diretor': 'Destin Cretton',
      'actores': [
        'Simu Liu',
        'Awkwafina',
        'Tony Leung ',
        'Meng er Zhang',
        'Fala Chen'
      ],
      'images': [
        'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcSgc0EgUR4uEW5ECnQc3HoVZifhaTlSlgEuDO8aBM8D_EDcUeBS9T_zNdi1wQAF',
        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT0S9eaXPr3G91_p6w1dv7bmHSaIhhbqyaDsZOLrqfNCZY6BX2H',
        'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcTw6daeGWxFQUsK2oF_8uvj7UjQaycuxgTBv8KJe02BWHLd0cMa80D_R1ftfy4g',
        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRUQ_vZq40PsWRCi1GSQhvPBwMhHrHFsQLRYEKo-cQZ-R45cbbz',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCKMLepo51o79HX_ud6Ab8qqbKMaT_7U2y26cDsVJCF2FOJJC7'
      ],
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
