import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:vaga/animation.dart';
import 'package:vaga/data.api/playList_api.dart';
import 'addPage.dart';
import 'deletePage.dart';

class HomePageBody extends StatefulWidget {
  @override
  HomePageBodyState createState() => HomePageBodyState();
}

class HomePageBodyState extends State<HomePageBody> {
  static String result;
  var firstColor = Colors.black, secondColor = Colors.black87;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: PenguAnima(),
          width: MediaQuery.of(context).size.width,
          height: 300.0,
        ),
        IconButton(
          icon: Icon(
            Icons.center_focus_strong,
            size: 60,
            color: Colors.lightGreen[700],
          ),
          onPressed: () {
            scanQR();
          },
        ),
        Container(
          margin: EdgeInsets.all(40.0),
          child: Row(
            children: <Widget>[
              RaisedButton(
                elevation: 4,
                color: Colors.white12,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
              ),
              Spacer(),
              RaisedButton(
                color: Colors.white12,
                elevation: 4,
                child: Icon(
                  Icons.delete_sweep,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeletePage()));
                },
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Future scanQR() async {
    var _qrResult = await BarcodeScanner.scan();
    setState(() {
      result =
          '''<iframe src="$_qrResult" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>''';
      print(_qrResult);
      PlayListApi.playListUrl = _qrResult.substring(40);
      return result;
    });
  }
}
