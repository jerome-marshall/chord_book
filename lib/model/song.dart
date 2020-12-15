import 'dart:convert';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Song songFromJson(String str) => Song.fromJson(json.decode(str));

String songToJson(Song data) => json.encode(data.toJson());

class Song with ChangeNotifier {
  Song({
    this.number,
    this.name,
    this.scale,
    this.mode,
    this.rhythm,
    this.misc,
  });

  Song initialize(Song song){
    this.number = song.number;
    this.name = song.name;
    this.scale = song.scale;
    this.mode = song.mode;
    this.rhythm = song.rhythm;
    this.misc = song.misc;
    return this;
  }

  int number;
  String name;
  String scale;
  String mode;
  String rhythm;
  String misc;

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
}
