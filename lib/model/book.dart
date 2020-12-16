import 'package:chord_book/model/song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Book with ChangeNotifier {

  String name;
  Map<String, Song> songs;

  Book({
    this.name,
    this.songs,
  });

  void update(Book book){
    this.name = book.name;
    this.songs = book.songs;
    notifyListeners();
  }

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    name: json["name"],
    songs: Map.from(json["songs"]).map((k, v) => MapEntry<String, Song>(k, Song.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "songs": Map.from(songs).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}