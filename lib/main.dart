import 'package:alarmsystem/Mqtt.dart';
import 'package:alarmsystem/assets/UIStrings.dart';
import 'package:alarmsystem/service/local_notification_service.dart';
import 'package:alarmsystem/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:alarmsystem/provider/theme_provider.dart';
import 'package:alarmsystem/widget/change_theme_button_widget.dart';
import 'package:alarmsystem/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocalNotificationService _localNotificationService =
      LocalNotificationService();

  MQTTConnection connection = MQTTConnection('44.204.47.202', 2001, '\\test');

  static const String title = 'Alarm system';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          connection.connect();
          return MaterialApp(
              title: title,
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home: SplashScreen()
              // ! Animation Fixed Try To Modify Splash screen :)
              //Adding animation to splash screen produces a 'A RenderFlex overflowed…' error.
              //uncomment next line to fix it.
              // AnimatedSplashScreen(splash: SplashScreen(),splashTransition: SplashTransition.fade, nextScreen: HomePage(),),
              );
        },
      );
}
