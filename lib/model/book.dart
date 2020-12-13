import 'dart:convert';

import 'package:chord_book/model/song.dart';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    this.book,
    this.songs,
  });

  String book;
  Map<String, Song> songs;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    book: json["book"],
    songs: Map.from(json["songs"]).map((k, v) => MapEntry<String, Song>(k, Song.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "book": book,
    "songs": Map.from(songs).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}
