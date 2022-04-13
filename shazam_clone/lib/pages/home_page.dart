import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool listening = false;
  bool showMusic = false;
  bool hideMusic = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 89, 170, 245),
              Color(0xff0186FF0),
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
                        !listening
                            ? const Icon(Icons.mic,
                                color: Colors.white, size: 35)
                            : Container(),
                        !listening
                            ? const Text(
                                "Toque para ouvir",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      listening = !listening;
                      setState(() {});

                      await Future.delayed(const Duration(seconds: 8));

                      showMusic = !showMusic;
                      setState(() {});
                    },
                    child: !listening
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
                              width: listening ? 300 : 0,
                              height: listening ? 300 : 0,
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
                width: listening ? 160 : 0,
                height: listening ? 160 : 0,
              ),
            ),
            if (listening)
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
                      RotateAnimatedText('Ouvindo'),
                      RotateAnimatedText('Agurade o resultado'),
                      TyperAnimatedText('Estamos preparando tudo',
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            listening
                ? Positioned(
                    top: 10,
                    right: 10,
                    child: FadeIn(
                      child: GestureDetector(
                        onTap: () {
                          listening = false;

                          showMusic = false;
                          setState(() {});
                        },
                        child: Container(
                          width: 85,
                          height: 26,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.2)),
                          child: Row(
                            children: [
                              const Icon(Icons.close, color: Colors.white),
                              const Text(
                                "Cancelar",
                                style: const TextStyle(
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
            if (showMusic)
              Positioned(
                bottom: !listening ? 0 : -100,
                top: -5,
                right: -5,
                left: -5,
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    height: size.height,
                    width: size.height,
                    decoration: BoxDecoration(color: Colors.grey[900]),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Image.network(
                              "https://content-jp.umgi.net/products/ui/UICU-1339_wLS_extralarge.jpg?28032022111022",
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showMusic = false;
                                  listening = false;
                                  setState(() {});
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white.withOpacity(0.5)),
                                  child: const Icon(Icons.close,
                                      color: Colors.white),
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
                                child: const Icon(Icons.drag_indicator,
                                    color: Colors.white),
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
                ),
              ),
            if (showMusic)
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
                          Colors.grey[800]!.withOpacity(0.1),
                          Colors.grey[800]!.withOpacity(0.1),
                          Colors.grey[800]!.withOpacity(0.1),
                          Colors.grey[800]!.withOpacity(0.1),
                          Colors.grey[800]!.withOpacity(0.1),
                          Colors.grey[850]!,
                          Colors.grey[850]!,
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
                                Colors.grey[800]!.withOpacity(0.1),
                                Colors.grey[800]!.withOpacity(0.1),
                                Colors.grey[800]!.withOpacity(0.1),
                                Colors.grey[800]!.withOpacity(0.1),
                                Colors.grey[800]!.withOpacity(0.1),
                                Colors.grey[850]!,
                                Colors.grey[850]!,
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
                                        const Text(
                                          "GASOLINE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22),
                                        ),
                                        const Text(
                                          "The Weeknd",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 60,
                                      height: 60,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xFF2196F3)),
                                      child: const Icon(Icons.play_arrow,
                                          color: Colors.white, size: 50),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 160,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xFF2196F3)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.play_arrow,
                                        color: Colors.white),
                                    const Text(
                                      "PLAY F...L SONG",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    ));
  }
}
