import 'package:atm/account/account_manger.dart';
import 'package:atm/user/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:atm/user/user.dart';
import 'screens/login_screem.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<User>(
            create: (_) => User(),
            lazy: false,
          ),
          ChangeNotifierProvider<UserManager>(
            create: (context) => UserManager(),
            lazy: false,
          ),
          ChangeNotifierProxyProvider<UserManager, AccountManager>(
            create: (_) => AccountManager(),
            update: (_, userManager, accountManager) {
              int id = userManager.user.id;

              if (id == null) {
                return null;
              } else {
                return accountManager..getAccount(userId: userManager.user.id);
              }
            },
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
              textTheme: TextTheme(
                title: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              iconTheme: IconThemeData(
                color: Color(0xff4ca6a8),
              ),
            ),
          ),
        ),
      ),
    );
