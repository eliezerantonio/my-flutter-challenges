import 'package:flutter/material.dart';
import 'package:nocinema/theme/theme.dart';
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
    final appTheme = context.watch<ThemeChanger>().currentTheme;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: appTheme?.colorScheme.secondary, size: 30),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
