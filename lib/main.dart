import 'package:alarmsystem/Mqtt.dart';
import 'package:alarmsystem/assets/UIStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:alarmsystem/provider/theme_provider.dart';
import 'package:alarmsystem/widget/change_theme_button_widget.dart';
import 'package:alarmsystem/page/home_page.dart';


void main() {
  runApp(MyApp());
}

/*class MyApp extends StatelessWidget {
  MyApp({key});

  @override
  Widget build(BuildContext context) {
    connection.connect();

    return MaterialApp(
        title: UIStrings.projectName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(UIStrings.projectName)),
          ),
          body: const Center(child: Text('Implement UI')),
        ));
  }
}*/

class MyApp extends StatelessWidget {
  MQTTConnection connection = MQTTConnection('44.204.177.187', 2001, '\\test');

  static const String title = 'Light & Dark Theme';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);

      return MaterialApp(
        title: title,
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: HomePage(),
      );
    },
  );
}
