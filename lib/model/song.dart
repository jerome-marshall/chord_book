import 'dart:convert';

Song songFromJson(String str) => Song.fromJson(json.decode(str));

String songToJson(Song data) => json.encode(data.toJson());

class Song {
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
