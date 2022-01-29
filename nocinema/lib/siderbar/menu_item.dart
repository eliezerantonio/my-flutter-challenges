import 'package:flutter/material.dart';
import 'package:nocinema/theme/theme.dart';
import 'package:nocinema/utils/myBackgroundColors.dart';
import 'package:provider/src/provider.dart';

class MenuItem extends StatelessWidget {
  MenuItem(
      {required this.icon,
      required this.title,
      this.page,
      required this.onTap});

  final IconData icon;
  final String title;
  final int? page;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeChanger>();
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon,
                color: appTheme.darkTheme
                    ? Color(darkCustomColor)
                    : appTheme.currentTheme!.colorScheme.secondary,
                size: 30),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
