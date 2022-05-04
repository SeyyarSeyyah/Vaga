import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vaga/animation.dart';
import 'package:vaga/data.api/playList_api.dart';
import 'package:vaga/models/CurrentlyPlayList.dart';

class DeletePage extends StatefulWidget {
  static String currentlyPlayListID;

  @override
  DeletePageState createState() => DeletePageState();
}

class DeletePageState extends State<DeletePage> {
  static Welcome trackList;

  Future _get;

  @override
  void initState() {
    getTracksFromApi();
    _get = getTracksFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return trackList == null
        ? QRAnima()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white10,
              title: Text("Silme Sayfası"),
              centerTitle: true,
            ),
            body: FutureBuilder(
              future: _get,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: trackList.tracks.items.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: Container(
                            color: Colors.red,
                            child: Icon(Icons.delete_sweep),
                          ),
                          key: Key(trackList.tracks.items[index].track.uri),
                          onDismissed: (directon) {
                            setState(() {
                              PlayListApi.deleteTrack(
                                  uri: trackList.tracks.items[index].track.uri,
                                  playListID: PlayListApi.playListUrl);
                              trackList.tracks.items.removeAt(index);
                            });

                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("Silindi")));
                          },
                          child: Card(
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(trackList
                                        .tracks
                                        .items[index]
                                        .track
                                        .album
                                        .images[2]
                                        .url
                                        .toString()),
                                  ),
                                  title: Text(
                                      trackList.tracks.items[index].track.name),
                                  subtitle: Text(trackList.tracks.items[index]
                                      .track.album.artists[0].name),
                                  onTap: () {}),
                              shadowColor: Colors.grey,
                              margin: EdgeInsets.all(4.0)),
                        );
                      });
                } else {
                  print(snapshot.connectionState);
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
  }

  Future getTracksFromApi() async {
    PlayListApi p = PlayListApi();
    var res = await p.getTracks();
    setState(() {
      var map = json.decode(res.body);
      trackList = Welcome.fromJson(map);
    });
    return trackList;
  }
}
