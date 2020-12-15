import 'package:chord_book/model/book.dart';
import 'package:chord_book/model/book_list.dart';
import 'package:chord_book/model/song.dart';
import 'package:chord_book/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chord_book/view/loading_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider<Book>(
        create: (cxt) => Book()
    ),
    ChangeNotifierProvider<Song>(
        create: (cxt) => Song()
    )
  ],
  child:   MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: HexColor('#E1E5EC')),
    initialRoute: LoadingScreen.routeName,
    routes: {
      LoadingScreen.routeName: (context) => LoadingScreen(),
      HomeScreen.routeName: (context) => HomeScreen(),
      // ChooseBook.routeName : (context) => ChooseBook(),
    },
  ),
));
