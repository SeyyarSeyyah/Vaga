import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:vaga/animation.dart';
import 'package:vaga/screens/homePageBody.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static var _listCode;

  @override
  Widget build(BuildContext context) {
    return _listCode == null
        ? QRAnima()
        : MaterialApp(
            title: 'Flutter Widget from HTML',
            home: Container(
              child: HtmlWidget(_listCode, webView: true),
            ));
  }

  @override
  void initState() {
    _listCode = HomePageBodyState.result;

    super.initState();
  }
}
