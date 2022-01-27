import 'package:flutter/material.dart';
import 'package:nocinema/theme/theme.dart';
import 'package:provider/src/provider.dart';


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
     final appTheme = context.watch<ThemeChanger>();
    final secondary = appTheme.currentTheme?.colorScheme.secondary;
   
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
            colors: appTheme.darkTheme
                ? backgroundDarkMode
                : backgroundWhiteMode,
          ),
        ),
      ),
    );
  }
}
