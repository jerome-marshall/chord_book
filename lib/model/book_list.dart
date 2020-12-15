// To parse this JSON data, do
//
//     final bookList = bookListFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/services.dart';

import 'book.dart';

BookList bookListFromJson(String str) => BookList.fromJson(json.decode(str));

String bookListToJson(BookList data) => json.encode(data.toJson());

class BookList {

  static BookList _instance;
  List<Book> list;

  BookList.json({
    this.list,
  });

  factory BookList(){
    if(_instance == null) {
      rootBundle.loadString('json/soz.json').then((value) {
        _instance = bookListFromJson(value);
        print(_instance.list);
      });
    }
    return _instance;
  }

  factory BookList.fromJson(Map<String, dynamic> json) => BookList.json(
    list: List<Book>.from(json["bookList"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "bookList": List<dynamic>.from(list.map((x) => x.toJson())),
  };

  set bookList (List<Book> bookList){this.list = bookList;}

  List<Book> get bookList {return this.list;}
}

