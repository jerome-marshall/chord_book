import 'package:auto_size_text/auto_size_text.dart';
import 'package:chord_book/model/book.dart';
import 'package:chord_book/model/book_list.dart';
import 'package:chord_book/model/song.dart';
import 'package:chord_book/size_config.dart';
import 'package:chord_book/style.dart';
import 'package:flutter/material.dart';
import 'package:chord_book/style.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import 'TestWithShader.dart';

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
          appBar: NeumorphicAppBar(
            title: Text("Choose Song Book"),
          ),
          body: Column(
            children: [
              Container(
                  height: height * 10,
                  child: Neumorphic(
                      margin: EdgeInsets.fromLTRB(
                          height * 2, height * 2, height * 2, 0),
                      padding: EdgeInsets.all(height * 2),
                      style: Style.neumorphicStyleProject,
                      child: TextWithShader(
                          text: "Choose Song Book",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 4,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5),
                          colorList: Style.colorList3,
                        ),
                  )
              ),
              Flexible(
                child: ListView.builder(
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
                              child: AutoSizeText(
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
              ),
            ],
          ),
        ));
  }
}
