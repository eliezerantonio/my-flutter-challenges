import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[850],
        ),
        onPressed: () {},
        child: const Text("DETALHES"),
      ),
    );
  }
}

//gradiante background

class BackgroundGradiante extends StatelessWidget {
  const BackgroundGradiante({
    Key? key,
    required this.darkMode,
    required this.backgroundDarkMode,
    required this.backgroundWhiteMode,
  }) : super(key: key);

  final bool darkMode;
  final List<Color> backgroundDarkMode;
  final List<Color> backgroundWhiteMode;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mode = Theme.of(context);
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
            colors: mode == mode.brightness
                ? backgroundDarkMode
                : backgroundWhiteMode,
          ),
        ),
      ),
    );
  }
}
