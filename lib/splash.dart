import 'package:alarmsystem/page/home_page.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue[800],Colors.lightBlueAccent,]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "lib/images/aast3.png",
                  height: 200.0,
                  width: 200.0,
                ),
                Text("\nArab Academy for Science and Technology",textAlign:TextAlign.center,
                  style: TextStyle(color: Colors.white, fontFamily: 'dogicapixel', fontSize: 15),
                ),
                Text("\n\n\n\n\n\n\nMahmoud Eltelt\nAdham Adel\nMohamed Elsayed\nAhmed Yasser",textAlign:TextAlign.center,
                  style: TextStyle(color: Colors.white, fontFamily: 'Inconsolata', fontSize: 18),
                ),
              ],
            ),

            CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
