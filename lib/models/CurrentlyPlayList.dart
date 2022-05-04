import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.tracks,
  });

  final Tracks tracks;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
      );

  Map<String, dynamic> toJson() => {
        "tracks": tracks == null ? null : tracks.toJson(),
      };
}

class Tracks {
  Tracks({
    this.items,
  });

  final List<Item> items;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.track,
  });

  final Track track;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        track: json["track"] == null ? null : Track.fromJson(json["track"]),
      );

  Map<String, dynamic> toJson() => {
        "track": track == null ? null : track.toJson(),
      };
}

class Track {
  Track({
    this.album,
    this.name,
    this.uri,
  });

  final Album album;
  final String name;
  final String uri;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        name: json["name"] == null ? null : json["name"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album": album == null ? null : album.toJson(),
        "name": name == null ? null : name,
        "uri": uri == null ? null : uri,
      };
}

class Album {
  Album({
    this.artists,
    this.images,
  });

  final List<Artist> artists;
  final List<Image> images;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        artists: json["artists"] == null
            ? null
            : List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "artists": artists == null
            ? null
            : List<dynamic>.from(artists.map((x) => x.toJson())),
        "images": images == null
            ? null
            : List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Artist {
  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  final ExternalUrls externalUrls;
  final String href;
  final String id;
  final String name;
  final String type;
  final String uri;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls == null ? null : externalUrls.toJson(),
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
        "uri": uri == null ? null : uri,
      };
}

class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  final String spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"] == null ? null : json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify == null ? null : spotify,
      };
}

class Image {
  Image({
    this.height,
    this.url,
    this.width,
  });

  final int height;
  final String url;
  final int width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"] == null ? null : json["height"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
      };
}
