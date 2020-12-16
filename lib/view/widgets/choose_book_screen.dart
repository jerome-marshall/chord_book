import 'package:chord_book/model/book.dart';
import 'package:chord_book/model/book_list.dart';
import 'package:chord_book/model/song.dart';
import 'package:chord_book/size_config.dart';
import 'package:chord_book/style.dart';
import 'package:flutter/material.dart';
import 'package:chord_book/style.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class ChooseBookScreen extends StatelessWidget {
  static const String routeName = '/choose_book_screen';

  BookList bookList;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    Book book = Provider.of<Book>(context, listen: false);
    Song song = Provider.of<Song>(context, listen: false);
    bookList = BookList();
    SizeConfig().init(context);
    width = SizeConfig.safeBlockHorizontal;
    height = SizeConfig.safeBlockVertical;

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: ListView.builder(
            itemCount: bookList.list.length,
            itemBuilder: (context, index) {
              return Container(
                height: height * 10,
                width: width * 90,
                child: NeumorphicButton(
                  margin:
                  EdgeInsets.fromLTRB(height * 2, height * 2, height * 2, 0),
                  padding: EdgeInsets.all(height * 1.75),
                  style: Style.neumorphicStyleProject,
                  onPressed: () {
                    book.update(bookList.list[index]);
                    song.update(bookList.list[index].songs["1"]);
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Image.asset(
                      //   'assets/song_book.png',
                      // ),
                      // SizedBox(
                      //   width: width * 4,
                      // ),
                      Flexible(
                        child: Text(
                          bookList.list[index].name,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: height * 3.5,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
