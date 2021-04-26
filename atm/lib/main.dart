import 'package:atm/models/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atm/models/client.dart' as modelClient;
import 'screens/login_screem.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserManager>(
            create: (context) => UserManager(),
            lazy: false,
          ),
          ChangeNotifierProvider<modelClient.Client>(
            create: (_) => modelClient.Client(),
            lazy: false,
          ),
        ],
        child: MaterialApp(
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xff4ca6a8),
            accentColor: Color(0xffbbeced),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              iconTheme: IconThemeData(
                color: Color(0xff4ca6a8),
              ),
            ),
          ),
        ),
      ),
    );
