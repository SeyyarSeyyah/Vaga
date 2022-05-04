import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaga/animation.dart';

import 'package:vaga/screens/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static bool splash = true;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white10,
      ),
      home: SplashScreen.navigate(
        name: 'assets/walk.flr',
        next: (_) => HomePage(),
        until: () => Future.delayed(Duration(seconds: 5)),
        startAnimation: "Untitled",
        backgroundColor: Colors.black87,
      ),
    );
  }
}
