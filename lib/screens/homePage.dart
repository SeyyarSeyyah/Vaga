import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaga/screens/homePageBody.dart';
import 'package:vaga/screens/listPage.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static var error = "Birşeyler okut";
  var appBarTitle = "Anasayfa";
  int _cindex = 0;
  final List<Widget> children = [HomePageBody(), ListPage()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          appBarTitle,
          style: GoogleFonts.openSans(),
        ),
        centerTitle: true,
      ),
      body: children[_cindex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.lightGreen[800],
        backgroundColor: Color(0x1ED752),
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.playlist_play, size: 30),
        ],
        index: _cindex,
        animationDuration: Duration(milliseconds: 200),
        buttonBackgroundColor: Colors.lightGreen[800],
        onTap: (index) {
          setState(() {
            _cindex = index;
            if (index == 1) {
              appBarTitle = "";
            } else
              appBarTitle = "Anasayfa";
          });
        },
      ),
    );
  }
}
