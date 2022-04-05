import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nocinema/providers/push_notification_provider.dart';
import 'package:nocinema/providers/trailer_provider.dart';
import 'package:nocinema/theme/theme.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'providers/movie_provider.dart';
import 'services/local_storage.dart';
import 'siderbar/sidebar_layout.dart';

PushNotificationProvider pushNotificationProvider = PushNotificationProvider();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage?.configurePrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  pushNotificationProvider.initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = LocalStorage.prefs.getInt("darkTheme");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => MoviesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(darkMode ?? 1),
        ),
        ChangeNotifierProvider(create: (_) => TrailerProvider())
      ],
      child: Builder(builder: (context) {
        var appTheme = context.watch<ThemeChanger>().currentTheme;

        return MaterialApp(
          title: 'NoCinema'.toUpperCase(),
          color: Colors.grey,
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: SidebarLayout(),
        );
      }),
    );
  }
}
