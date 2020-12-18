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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    width = SizeConfig.safeBlockHorizontal;
    height = SizeConfig.safeBlockVertical;

    Song song = Provider.of<Song>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: Consts.avatarRadius + Consts.padding,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: Consts.avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
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
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.0),
                Text(
                  song.getCapoString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "All Scales",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 24.0),
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
                  radius: Consts.avatarRadius,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        song.scale,
                        style: TextStyle(
                            fontSize: height * 7,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.5),
                      ),
                      Text(
                        ' ' + song.mode,
                        style: TextStyle(
                            fontSize: height * 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1.5),
                      ),
                    ],
                  )),
              MaterialButton(
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

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
