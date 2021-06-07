
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'account/account_manger.dart';
import 'screens/login_screem.dart';
import 'services/twilio_service.dart';
import 'user/user.dart';
import 'user/user_manager.dart';

void main() {
  TwilioApi twilioApi = TwilioApi();
  twilioApi.sendSms();
  runApp(
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

            if (id != null) {
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
}
