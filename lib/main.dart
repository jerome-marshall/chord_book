import 'package:chord_book/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chord_book/view/loading_screen.dart';
import 'package:hexcolor/hexcolor.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: HexColor('#E1E5EC')
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        LoadingScreen.routeName: (context) => LoadingScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        // ChooseBook.routeName : (context) => ChooseBook(),
      },
    ));
