import 'package:flutter/material.dart';
import 'package:vaga/animation.dart';
import 'package:vaga/data.api/playList_api.dart';

class DataSearch extends SearchDelegate<String> {
  Future _get;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
          PlayListApi.resultList = null;
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != null) {
      _get = PlayListApi.getSearchResultFromAPI(query);
    } else if (query = null) {
      PlayListApi.resultList = null;
    }

    return PlayListApi.resultList == null
        ? Center(
            child: BurnAnima(),
          )
        : FutureBuilder(
            future: _get,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(PlayListApi
                                  .resultList
                                  .tracks
                                  .items[index]
                                  .album
                                  .images[2]
                                  .url
                                  .toString()),
                            ),
                            title: Text(PlayListApi
                                .resultList.tracks.items[index].name),
                            subtitle: Text(PlayListApi.resultList.tracks
                                .items[index].album.artists[0].name),
                            onTap: () {
                              RemoveAlert(index, context);
                            }),
                        shadowColor: Colors.grey,
                        margin: EdgeInsets.all(4.0));
                  },
                  itemCount: PlayListApi.resultList.tracks.items.length,
                );
              } else {
                print(snapshot.connectionState);
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
  }

  Future<AlertDialog> RemoveAlert(index, BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Ekle"),
              content: Text("Eklemek istediğinize emin misiniz?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      PlayListApi.postAddTrack(
                          PlayListApi.resultList.tracks.items[index].uri);
                      Navigator.of(_).pop();
                    },
                    child: Center(
                      child: Text("Evet"),
                    )),
                FlatButton(
                  onPressed: () {
                    Navigator.of(_).pop();
                  },
                  child: Text("Hayır"),
                )
              ],
            ));
  }
}
