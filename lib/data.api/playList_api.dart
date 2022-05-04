import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vaga/models/addtruck.dart';
import 'package:vaga/models/token.dart';
import 'package:vaga/utilities/tools.dart';

class PlayListApi extends State {
  static var playListUrl;
  static var token2 =
      "BQD_sn9exLg9GtqMYA11Km3fYT4yQuX0kUQYrhP_SC9qGURh28E_K3JDR1LvUDN_8Il6z_nPsW4ztMbnT_mWdm92dtWPq3Ia4M10wbe3WqzdeIeMpo7N78pDQMjc2pAvedkn5fdNKyq0Jq-tczostTiorBgxB6V7APBJnPz1rGJsDcTzXdMsgHJ6zuKx1o8aAGWETNnTFXGgczJ6ytfmVToG_6itpiWSMMAeaKyLo7GjPVdLZP-X5Uj-wG1Y7tK-Ndt8efPf";
  static SearchResults resultList;

  // Mevcut listenin elamanlarını API'dan alan fonksiyon
  Future getTracks() async {
    var _headers = {
      "Authorization": "Bearer " + token2,
      "Accept": "application/json",
      "Content-Type": "application/json"
    };

    var res = await http.get(
        "https://api.spotify.com/v1/playlists/$playListUrl?fields=tracks.items(track(name%2Curi%2Calbum(images%2Cartists)))",
        headers: _headers);
    print(res.statusCode);
    if (res.statusCode == 200) {
      return res;
    } else {
      throw Exception(res.statusCode);
    }
  }

// Mevcut listeden silme işlemini yapan fonksiyon
  static deleteTrack({String playListID, String uri}) async {
    var _data = {
      "tracks": [
        {"uri": "$uri"}
      ]
    };
    String baseUrl = "https://api.spotify.com/v1/playlists/$playListID/tracks";
    final url = Uri.parse(baseUrl);
    final request = http.Request("DELETE", url);
    request.headers.addAll(<String, String>{
      'Authorization': 'Bearer ' + token2,
      'Content-Type': 'application/json',
    });
    request.body = jsonEncode(_data);
    final response = await request.send();

    if (response.statusCode != 200) {
      print("error: status code ${response.statusCode}");
    }
  }

// Arama sonuçlarını döndüren fonksiyon
  static getSearch(String q) async {
    String query = Tools.queryFormater(q);

    var _headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token2,
    };

    var res = await http.get(
        "https://api.spotify.com/v1/search?q=$query&type=track&limit=10",
        headers: _headers);
    print(res.statusCode);
    print(q);
    if (res.statusCode == 200) {
      return res;
    } else {
      throw Exception(res.statusCode);
    }
  }

// arama sonuçlarını objeye dolduran fonksiyon
  static getSearchResultFromAPI(var q) async {
    print(q);
    var res = await PlayListApi.getSearch(q);
    var map = json.decode(res.body);
    resultList = SearchResults.fromJson(map);
    print(resultList.tracks.items.length);

    return resultList;
  }

// Seçilen parçayı listeye ekleme işini yapan fonksiyon
  static postAddTrack(String uri) async {
    var _body = jsonEncode({
      "uris": [uri]
    });

    String baseUrl = "https://api.spotify.com/v1/playlists/$playListUrl/tracks";
    final url = Uri.parse(baseUrl);
    final request = http.Request("POST", url);
    request.headers.addAll(<String, String>{
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token2,
    });
    request.body = _body;
    final response = await request.send();

    if (response.statusCode != 200) {
      print("error: status code ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {}
}
