import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/deezer_song.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({Key key, @required this.song}) : super(key: key);
  final DeezerSong song;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[900]),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Image.network(
                          song?.album?.coverMedium ??
                              "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
                          fit: BoxFit.cover,
                          width: size.width,
                          height: 400,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: FadeInUp(
                child: Container(
                  height: size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey[800].withOpacity(0.1),
                        Colors.grey[800].withOpacity(0.1),
                        Colors.grey[800].withOpacity(0.1),
                        Colors.grey[800].withOpacity(0.1),
                        Colors.grey[800].withOpacity(0.1),
                        Colors.grey[850],
                        Colors.grey[850],
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: FadeInUp(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.grey[800].withOpacity(0.1),
                              Colors.grey[800].withOpacity(0.1),
                              Colors.grey[800].withOpacity(0.1),
                              Colors.grey[800].withOpacity(0.1),
                              Colors.grey[800].withOpacity(0.1),
                              Colors.grey[850],
                              Colors.grey[850],
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * .7,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        song?.title ?? '',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      AutoSizeText(
                                        song?.artist?.name ?? '',
                                        minFontSize: 8,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        song?.album?.title ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  FadeInRight(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xFF2196F3)),
                                      child: const Icon(Icons.play_arrow,
                                          color: Colors.white, size: 50),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            BounceInUp(
                              duration: const Duration(milliseconds: 8000),
                              from: 90,
                              child: Container(
                                width: 160,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xFF2196F3)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.play_arrow, color: Colors.white),
                                    Text(
                                      "PLAY F...L SONG",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.5)),
                    child: const Icon(Icons.queue_music_sharp,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.5)),
                    child: const Icon(Icons.ios_share_outlined,
                        size: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.5)),
                    child:
                        const Icon(Icons.drag_indicator, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
