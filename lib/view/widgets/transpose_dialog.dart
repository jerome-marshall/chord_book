import 'package:chord_book/model/song.dart';
import 'package:chord_book/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransposeDialog extends StatefulWidget {
  @override
  _TransposeDialogState createState() => _TransposeDialogState();
}

class _TransposeDialogState extends State<TransposeDialog> {
  double width;
  double height;

  double padding;
  double avatarRadius;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    width = SizeConfig.safeBlockHorizontal;
    height = SizeConfig.safeBlockVertical;
    padding = height*3;
    avatarRadius = height * 8;

    Song song = Provider.of<Song>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: avatarRadius + padding,
              bottom: padding,
              left: padding,
              right: padding,
            ),
            margin: EdgeInsets.only(top: avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Consumer<Song>(
                  builder: (context, song, child){
                    return Text(
                      'Transpose: ' + song.transVal.toString(),
                      style: TextStyle(
                        fontSize: height * 3,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
                SizedBox(height: height * 1.5),
                Text(
                  song.getCapoString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: height * 2),
                Text(
                  "#Todo - All Scales",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: height * 3),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    textColor: Colors.blueAccent,
                    onPressed: () {
                      song.updateScale();
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: Text('Okay'),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.only(top: height * 8),
                child: Text(
                  '-',
                  style: TextStyle(
                      fontSize: height * 6,
                      color: Colors.indigo[700],
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.5),
                ),
                onPressed: () => song.transpose('-'),
              ),
              CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: avatarRadius,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        song.scale,
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: height * 7,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.5),
                      ),
                      Text(
                        song.mode,
                        style: TextStyle(
                            fontSize: height * 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.5),
                      ),
                    ],
                  )),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: EdgeInsets.only(top: height * 8),
                child: Text(
                  '+',
                  style: TextStyle(
                      fontSize: height * 5,
                      color: Colors.indigo[700],
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.5),
                ),
                onPressed: () => song.transpose('+'),
              ),
            ],
          )
          //...bottom card part,
          //...top circlular image part,
        ],
      ),
    );
  }
}