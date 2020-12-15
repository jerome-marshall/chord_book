import 'package:chord_book/model/book.dart';
import 'package:chord_book/model/book_list.dart';
import 'package:chord_book/model/song.dart';
import 'package:chord_book/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  BookList bookList;

  @override
  Widget build(BuildContext context) {
    // loadData(context);

    return Scaffold(
      backgroundColor: HexColor('#E1E5EC'),
      body: Container(
        child: SpinKitWave(
          color: Colors.grey[800],
          size: 50.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    BookList bookList = BookList();
    Future.delayed(Duration(seconds: 3)).then((_) {
      BookList bookList = BookList();
      Book book = Provider.of<Book>(context, listen: false).initialize(bookList.list[0]);
      Song song = Provider.of<Song>(context, listen: false).initialize(book.songs["1"]);
      Navigator.pushReplacementNamed(
        context, HomeScreen.routeName,
      );
    });
  }
}
