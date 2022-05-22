import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:shazam_clone/models/deezer_song_manager.dart';

import 'song_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final songManager = context.read<DeezerSongManager>();
    if (songManager.success && mounted) {
      Future.delayed(const Duration(seconds: 1));

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SongScreen(
              song: songManager.currentSong,
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final songManager = context.watch<DeezerSongManager>();

    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 89, 170, 245),
              Color(0xff0186ff0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInDown(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        !songManager.isRecognizing
                            ? const Icon(Icons.mic,
                                color: Colors.white, size: 35)
                            : Container(),
                        !songManager.isRecognizing
                            ? DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Horizon',
                                    fontWeight: FontWeight.bold),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText('Tap To Listen'),
                                    TyperAnimatedText('Shazam Clone',
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      songManager.startRecognizing();
                    },
                    child: !songManager.isRecognizing
                        ? FadeInUp(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/logo2.png"),
                                ),
                              ),
                              width: 200,
                              height: 200,
                            ),
                          )
                        : FadeInUp(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/mic.gif"),
                                ),
                              ),
                              width: songManager.isRecognizing ? 300 : 0,
                              height: songManager.isRecognizing ? 300 : 0,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 4,
              left: 10,
              right: 10,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/listening.gif"),
                  ),
                ),
                width: songManager.isRecognizing ? 160 : 0,
                height: songManager.isRecognizing ? 160 : 0,
              ),
            ),
            if (songManager.isRecognizing)
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Horizon',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Listening'),
                      RotateAnimatedText('Wait for the result'),
                      TyperAnimatedText('We are preparing everything',
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            songManager.isRecognizing
                ? Positioned(
                    top: 10,
                    right: 10,
                    child: FadeIn(
                      child: GestureDetector(
                        onTap: () {
                          songManager.stopRecognizing();
                        },
                        child: Container(
                          width: 85,
                          height: 26,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.2)),
                          child: Row(
                            children: const [
                              Icon(Icons.close, color: Colors.white),
                              Text(
                                "Cancelar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    ));
  }
}
