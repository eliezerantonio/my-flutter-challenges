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
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !listening
                          ? const Icon(Icons.mic, color: Colors.white, size: 35)
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
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      listening = !listening;
                      setState(() {});

                      await Future.delayed(Duration(seconds: 5));

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
              bottom: 0,
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
            listening
                ? Positioned(
                    top: 10,
                    right: 10,
                    child: FadeIn(
                      child: GestureDetector(
                        onTap: () {
                          listening = !listening;
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
            if (showMusic)
              Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                left: 0,
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
                                "https://content-jp.umgi.net/products/ui/UICU-1339_wLS_extralarge.jpg?28032022111022")
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.5)),
                                child: Icon(Icons.close, color: Colors.white),
                              ),
                              Spacer(),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.5)),
                                child: Icon(Icons.queue_music_sharp,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.5)),
                                child: Icon(Icons.ios_share_outlined,
                                    size: 20, color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white.withOpacity(0.5)),
                                child: Icon(Icons.drag_indicator,
                                    color: Colors.white),
                              ),
                              SizedBox(
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
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.grey[800]!.withOpacity(0.2),
                        Colors.grey[800]!.withOpacity(0.2),
                        Colors.grey[800]!.withOpacity(0.2),
                        Colors.grey[850]!,
                        Colors.grey[850]!,
                        Colors.grey[850]!,
                        Colors.grey[850]!,
                        Colors.grey[850]!,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "GASOLINE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                Text(
                                  "The Weeknd",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 60,
                              height: 60,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFF2196F3)),
                              child: Icon(Icons.play_arrow,
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
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    ));
  }
}
