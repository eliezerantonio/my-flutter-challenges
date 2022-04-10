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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
      child: SafeArea(
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
                : Container()
          ],
        ),
      ),
    ));
  }
}
