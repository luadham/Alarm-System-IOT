import 'package:alarmsystem/Mqtt.dart';
import 'package:alarmsystem/assets/UIStrings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({key});

  MQTTConnection connection = MQTTConnection('44.204.177.187', 2001, '\\test');

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
}
