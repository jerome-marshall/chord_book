import 'dart:convert';

import 'package:chord_book/model/scale.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Song songFromJson(String str) => Song.fromJson(json.decode(str));

String songToJson(Song data) => json.encode(data.toJson());

class Song extends Scale with ChangeNotifier {
  Song({
    this.number,
    this.name,
    this.scale,
    this.mode,
    this.rhythm,
    this.misc,
  });

  int number;
  String name;
  String scale;
  String mode;
  String rhythm;
  String misc;
  int transVal = 0;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
    number: json["number"],
    name: json["name"],
    scale: json["scale"],
    mode: json["mode"],
    rhythm: json["rhythm"],
    misc: json["misc"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "scale": scale,
    "mode": mode,
    "rhythm": rhythm,
    "misc": misc,
  };

  void update(Song song){
    this.number = song.number;
    this.name = song.name;
    this.scale = song.scale;
    this.mode = song.mode;
    this.rhythm = song.rhythm;
    this.misc = song.misc;
    this.transVal = 0;
    setScale(this.scale, this.mode);
    notifyListeners();
  }

  void updateScale(){
    setScale(this.scale, this.mode);
    notifyListeners();
  }

  void transpose(String transType){
    int scaleNo;

    if(transType == "+")
      this.transVal++;
    if(transType == '-')
      this.transVal--;

    if(this.transVal > 11 || this.transVal < -11)
      this.transVal = 0;

    print("transVal: " + this.transVal.toString());
    print("ScaleNo: " + getScaleNumber(this.scale).toString());

    if(transType == "+")
      scaleNo = getScaleNumber(this.scale) - 1 ;
    if(transType == "-")
      scaleNo = getScaleNumber(this.scale) + 1 ;

    scaleNo %= 12;
    this.scale = getScale(scaleNo);

    print("NewScaleNo: " + scaleNo.toString());

    notifyListeners();
  }

  String getCapoString(){
    String suffix;

    int capoVal = transVal;
    if (capoVal < 0)
      capoVal = 12 + capoVal;

    switch(capoVal){
      case 0: return "No Capo";
      case 1: {
        suffix = "st";
        break;
      }
      case 2: {
        suffix = "nd";
        break;
      }
      case 3: {
        suffix = "rd";
        break;
      }
      default: {
        suffix = "th";
      }
    }
    return "Capo on " + capoVal.toString() + suffix + " fret";
  }
}
