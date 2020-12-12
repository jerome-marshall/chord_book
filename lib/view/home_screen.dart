import 'package:auto_size_text/auto_size_text.dart';
import 'package:chord_book/view/widgets/TestWithShader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../size_config.dart';
import '../style.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();

  var scaleRhythmGroup = AutoSizeGroup();
  var scaleDegGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.safeBlockHorizontal;
    double height = SizeConfig.safeBlockVertical;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: <Widget>[
              bookSelectButton(height, width),
              SizedBox(height: height * 2),
              songNoFieldName(height, width),
              SizedBox(height: height * 3),
              // Scale Rhythm Degree Misc
              Expanded(
                child: Container(
                  child: Neumorphic(
                    padding: EdgeInsets.fromLTRB(
                        height * 3.5, height / 2, height * 3.5, 0),
                    margin: EdgeInsets.all(height),
                    style: Style.neumorphicStyleDepth,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                            0, (height * 2) + height / 2, 0, height * 3),
                        child: Column(
                          children: <Widget>[
                            // Scale and Rhythm
                            scaleAndRhythm(height, context),

                            SizedBox(
                              height: height,
                            ),

                            // Scale Degree
                            scaleDegree(height, width),

                            // Misc. Chords
                            miscChords(height),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget bookSelectButton(double height, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Container(
              height: height * 10,
              child: NeumorphicButton(
                  margin: EdgeInsets.fromLTRB(
                      height * 2, height * 2, height * 2, 0),
                  padding: EdgeInsets.all(height * 2),
                  style: Style.neumorphicStyleProject,
                  onPressed: () async {
                    // dynamic result =
                    // await Navigator.pushNamed(context, '/choose_book');
                    // setState(() {
                    //   textController.text = '1';
                    //   bundle = result;
                    // });
                  },
                  child: TextWithShader(
                    text: "Song Book",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 4,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5),
                    colorList: Style.colorList3,
                  )
              )
          ),
        ),
      ],
    );
  }

  Widget songNoFieldName(double height, double width) {
    return Container(
      height: height * 12.5,
      padding: EdgeInsets.fromLTRB(height * 2, height * 2, height * 2, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Song Number
          Expanded(
            flex: 3,
            child: Neumorphic(
                style: Style.neumorphicStyleProjectBlue,
                child: Center(
                  child: ShaderMask(
                    // shaderCallback: (bounds) => RadialGradient(
                    //   center: Alignment.topLeft,
                    //   radius: 1.0,
                    //   colors: Style.colorList,
                    //   tileMode: TileMode.mirror,
                    // ).createShader(bounds),
                    shaderCallback: (Rect bounds) {
                      final gradient = LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: Style.colorList3,
                      );
                      return gradient.createShader(Offset.zero & bounds.size);
                    },
                    child: TextField(
                      controller: textController,
                      textAlign: TextAlign.center,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(height),
                        hintText: '.....',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (String value) async {
                        print(value);
                        // song.updateSongNo(songBook[value]);
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: height * 5,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2),
                    ),
                  ),
                )),
          ),

          SizedBox(width: width * 6),

          // Song Name
          Expanded(
            flex: 8,
            child: Neumorphic(
              padding: EdgeInsets.all(height),
              style: Style.neumorphicStyleProject,
              child: Container(
                child: Center(
                  child: AutoSizeText(
                    "Song Name",
                    // song.name,
                    style: TextStyle(
                        fontSize: height * 3.5,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Catamaran',
                        letterSpacing: 1.5),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget scaleAndRhythm(double height, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // Scale
        Expanded(
          child: Column(
            children: <Widget>[
              TextWithShader(
                text: 'Scale',
                style: TextStyle(
                    fontSize: height * 1.8,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5),
                colorList: Style.colorList2,
              ),
              SizedBox(
                height: height,
              ),
              AutoSizeText(
                "D maj",
                // song.scale + " " + song.mode,
                style: TextStyle(
                    fontSize: height * 6,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5),
                maxLines: 1,
                group: scaleRhythmGroup,
              ),
            ],
          ),
        ),

        // Transpose Button
        transposeButton(height, context),

        // Rhythm
        Expanded(
          child: Column(
            children: <Widget>[
              TextWithShader(
                text: 'Rhythm',
                style: TextStyle(
                    fontSize: height * 1.8,
                    color: HexColor('#082AF2'),
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5),
                colorList: Style.colorList2,
              ),
              SizedBox(
                height: height,
              ),
              AutoSizeText(
                "4/4",
                // song.rhythm,
                style: TextStyle(
                    fontSize: height * 6,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5),
                maxLines: 1,
                group: scaleRhythmGroup,
              )
            ],
          ),
        ),
      ],
    );
  }
  //
  Widget transposeButton(double height, BuildContext context) {
    return NeumorphicButton(
        margin: EdgeInsets.fromLTRB(
            height * 3.5, height * 2, height * 3.5, height * 2),
        padding: EdgeInsets.all(height * 2),
        style: Style.neumorphicStyleProjectRound,
        onPressed: () async {
          // dynamic result = await showDialog(
          //   context: context,
          //   builder: (BuildContext context) => TransposeDialog(song: song),
          // );
        },
        child: Column(
          children: <Widget>[
            TextWithShader(
              text: 'Trans',
              style: TextStyle(fontSize: height * 2, letterSpacing: 1.0, color: Colors.white),
              colorList: Style.colorList2,
            ),
            AutoSizeText(
              "0",
              // song.transpose.toString(),
              style: TextStyle(
                  fontSize: height * 2.5,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.5,
                  color: Colors.grey[700]
              ),
            ),
          ],
        ));
  }

  Widget scaleDegree(double height, double width) {
     String dim = String.fromCharCode(119212);
     String sharp = String.fromCharCode(9839);
     String flat = String.fromCharCode(9837);
     List<String> list = ['Cm', 'D$dim', 'E$flat', 'Fm', 'Gm', 'A$flat', 'B$flat'];

    return Container(
      alignment: Alignment.center,
      height: height * 41,
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: width / 3.5,
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 2,
        primary: false,
        children: list.map((e){
          String degree = '';
          switch(list.indexOf(e)){
            case 0: {degree = 'i'; break;}
            case 1: {degree = 'ii'; break;}
            case 2: {degree = 'iii'; break;}
            case 3: {degree = 'iv'; break;}
            case 4: {degree = 'v'; break;}
            case 5: {degree = 'vi'; break;}
            case 6: {degree = 'vii'; break;}
            default: {degree = '';}
          }
          return Neumorphic(
            margin: EdgeInsets.fromLTRB(height * 2, height, height * 2, height),
            padding: EdgeInsets.all(height * 1.2),
            style: Style.neumorphicStyleProject,
            child: Column(
              children: <Widget>[
                Text(
                  degree,
                  style: TextStyle(
                      fontSize: height * 1.75,
                      color: HexColor("#021B79"),
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.5),
                ),
                SizedBox(
                  height: width / 4,
                ),
                AutoSizeText(
                  e,
                  style: TextStyle(
                      fontSize: height * 3.5,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.5),
                  group: scaleDegGroup,
                  maxLines: 1,
                )
              ],
            ),
          );
        }).toList()
      ),
    );
  }

  Widget miscChords(double height) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Neumorphic(
              margin:
              EdgeInsets.fromLTRB(height * 2, height * 2, height * 2, 0),
              padding: EdgeInsets.all(height * 2),
              style: Style.neumorphicStyleProject,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextWithShader(
                    text: 'Misc. Chords',
                    style: TextStyle(
                        fontSize: height * 2,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.5),
                    colorList: Style.colorList2,
                  ),
                  SizedBox(
                    height: height,
                  ),
                  AutoSizeText(
                    "Misc Chords ",
                    // song.misc,
                    style: TextStyle(
                        fontSize: height * 2.5,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.5),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
