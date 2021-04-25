import 'package:flutter/material.dart';

import 'screens/login_screem.dart';

void main() => runApp(
      MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xff4ca6a8),
            accentColor: Color(0xffbbeced),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: Colors.white,
            )),
      ),
    );
