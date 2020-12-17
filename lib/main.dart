import 'package:chord_book/model/book.dart';
import 'package:chord_book/model/book_list.dart';
import 'package:chord_book/model/song.dart';
import 'package:chord_book/view/home_screen.dart';
import 'package:chord_book/view/widgets/choose_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:chord_book/view/loading_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
  child: NeumorphicApp(
    // theme: ThemeData(scaffoldBackgroundColor: HexColor('#E1E5EC')),
    themeMode: ThemeMode.light,
    theme: NeumorphicThemeData(
      baseColor: HexColor("#e1e5ec"),
      lightSource: LightSource.topLeft,
      depth: 10,
    ),
    darkTheme: NeumorphicThemeData(
      baseColor: HexColor("#eff2f5"),
      lightSource: LightSource.topLeft,
      depth: 6,
    ),
    initialRoute: LoadingScreen.routeName,
    routes: {
      LoadingScreen.routeName: (context) => LoadingScreen(),
      HomeScreen.routeName: (context) => HomeScreen(),
      ChooseBookScreen.routeName : (context) => ChooseBookScreen(),
    },
  ),
));
