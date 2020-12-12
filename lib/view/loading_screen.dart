import 'package:chord_book/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

class LoadingScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
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
    getData();
  }

  void getData() async {
   //  Song song = new Song();
   //  Map songBook = await JsonData().getInitSongBook();
   // song.number = songBook['1']['number'];
   // song.name = songBook['1']['name'];
   // song.book = songBook['book'];
   // song.scale = songBook['1']['scale'];
   // song.mode = songBook['1']['mode'];
   // song.rhythm = songBook['1']['rhythm'];
   // song.misc = songBook['1']['misc'];
   // song.transpose = 0;


    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(
        context, HomeScreen.routeName,
        // arguments: {'songBook': songBook}
      );
    });
  }
}
