import 'package:atm/account/account_manger.dart';
import 'package:atm/user/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atm/user/user.dart';
import 'screens/login_screem.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserManager>(
            create: (context) => UserManager(),
            lazy: false,
          ),
          ChangeNotifierProxyProvider<UserManager, AccountManager>(
            create: (_) => AccountManager(),
            update: (_, userManager, resersvesManager) =>
                resersvesManager..getAccount(userId: userManager.user.id),
            lazy: false,
          ),
          ChangeNotifierProvider<User>(
            create: (_) => User(),
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
