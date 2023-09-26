// To parse this JSON data, do
//
//     final albumModelid = albumModelidFromJson(jsonString);

import 'dart:convert';

List<AlbumModelid> albumModelidFromJson(String str) => List<AlbumModelid>.from(json.decode(str).map((x) => AlbumModelid.fromJson(x)));

String albumModelidToJson(List<AlbumModelid> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumModelid {
  int? albumId;
  int? id;
  String? title;
  String? url;
  var thumbnailUrl;

  AlbumModelid({
     this.albumId,
     this.id,
     this.title,
     this.url,
     this.thumbnailUrl,
  });

  factory AlbumModelid.fromJson(Map<String, dynamic> json) => AlbumModelid(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
