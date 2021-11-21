import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  bool auth = false;

  late AnimationController controller;
  late AnimationController controller2;
  late Animation<double> moveRight;
  late Animation<double> moveLeft;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    moveRight = Tween(begin: -570.0, end: 570.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            width: size.width,
            child: Stack(
              children: [
                if (auth) _registration(),
                if (!auth) login(),
                Transform.translate(
                  offset: Offset(moveRight.value, 0),
                  child: AnimatedContainer(
                    child: BounceInDown(
                      duration: const Duration(milliseconds: 3000),
                      from: 100,
                      child: Column(
                        children: [
                          if (!auth) ...[
                            const SizedBox(
                              height: 90,
                            ),
                            const Text(
                              "Não tem uma conta ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Faça o seu cadastro",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                auth = !auth;
                                print(auth);
                                controller.forward();

                                setState(() {});
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                  const BorderSide(color: Colors.white),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "CADASTRAR",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                          if (auth) ...[
                            const SizedBox(
                              height: 90,
                            ),
                            const Text(
                              "Ja tem uma conta ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Podes entrar aqui",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                auth = !auth;
                                print(auth);
                                controller.reverse();

                                setState(() {});
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                  const BorderSide(color: Colors.white),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    height: size.height,
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    alignment: !auth ? Alignment.topRight : Alignment.topLeft,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(600),
                          bottomLeft: Radius.circular(600)),
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                ),
                if (!auth)
                  Positioned(
                    bottom: 80,
                    left: 270,
                    child: FadeInLeftBig(
                      delay: const Duration(milliseconds: 20),
                      child: SvgPicture.asset(
                        "assets/06.svg",
                        width: 400,
                      ),
                    ),
                  ),
                if (auth)
                  Positioned(
                    bottom: 80,
                    right: 270,
                    child: FadeInRight(
                      delay: const Duration(milliseconds: 20),
                      child: SvgPicture.asset(
                        "assets/07.svg",
                        width: 400,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Positioned login() {
    return Positioned(
      right: 160,
      child: Container(
        margin: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            FadeIn(
              duration: const Duration(milliseconds: 4000),
              child: const Text(
                "Entrar",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInLeft(
              child: Container(
                height: 44,
                width: 300,
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: const Text("E-mail"),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInRight(
              child: Container(
                height: 44,
                alignment: Alignment.centerLeft,
                width: 300,
                padding: const EdgeInsets.only(left: 10),
                child: const Text("Password"),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeIn(
              duration: const Duration(milliseconds: 4000),
              child: Container(
                height: 44,
                width: 150,
                alignment: Alignment.center,
                child: const Text(
                  "ENTRAR",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeInUp(child: const Text("Entre com uma das redes socias")),
            const SizedBox(
              height: 30,
            ),
            FadeIn(
              duration: const Duration(milliseconds: 4000),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BounceInDown(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                  BounceInUp(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                  BounceInDown(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                  BounceInUp(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _registration() {
    return Positioned(
      left: 160,
      child: Container(
        margin: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            FadeIn(
              duration: const Duration(milliseconds: 4000),
              child: const Text(
                "Cadastro",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInRight(
              child: Container(
                height: 44,
                width: 300,
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: const Text("Username"),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInLeftBig(
              child: Container(
                height: 44,
                width: 300,
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: const Text("E-mail"),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInRightBig(
              child: Container(
                height: 44,
                alignment: Alignment.centerLeft,
                width: 300,
                padding: const EdgeInsets.only(left: 10),
                child: const Text("Password"),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInDown(
              duration: const Duration(milliseconds: 2000),
              child: Container(
                height: 44,
                width: 150,
                alignment: Alignment.center,
                child: const Text(
                  "ENTRAR",
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeInUp(child: const Text("Entre com uma das redes socias")),
            const SizedBox(
              height: 30,
            ),
            FadeInDown(
              duration: const Duration(milliseconds: 2000),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BounceInDown(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                  BounceInUp(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                  BounceInDown(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                  BounceInUp(
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
