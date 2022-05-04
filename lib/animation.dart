import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:vaga/main.dart';

class QRAnima extends StatefulWidget {
  @override
  _QRAnimaState createState() => _QRAnimaState();
}

class _QRAnimaState extends State<QRAnima> {
  String _qrAnimationName = "corner-movement";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: FlareActor(
                "assets/try.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: _qrAnimationName,
              ),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
            Text(
              "Opps!",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            Divider(
              color: Colors.white,
            ),
            Text(
              "Bunu yapmadadan önce bir karekod taramalısın.",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

class BurnAnima extends StatefulWidget {
  @override
  _BurnAnimaState createState() => _BurnAnimaState();
}

class _BurnAnimaState extends State<BurnAnima> {
  String _burnAnimationName = "Burn";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Center(
              child: FlareActor(
            "assets/Burn.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: _burnAnimationName,
          )),
          width: 120,
          height: 120,
          alignment: Alignment.center,
        ),
        Text(
          "Burada henüz gösterecek birşey yok!",
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class PenguAnima extends StatefulWidget {
  @override
  _PenguAnimaState createState() => _PenguAnimaState();
}

class _PenguAnimaState extends State<PenguAnima> {
  var _penguAnimationName = "music_walk";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: FlareActor(
          "assets/dance.flr",
          callback: (s) {
            setState(() {
              MyApp.splash = false;
            });
          },
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: _penguAnimationName,
        )),
        width: MediaQuery.of(context).size.width,
        height: 200);
  }
}
