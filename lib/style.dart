import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hexcolor/hexcolor.dart';

class Style {
  static List<Color> colorList3 = [HexColor("#00bccc"), HexColor("#0575E6"), HexColor("#021B79")];
  static List<Color> colorList2 = [HexColor("#0575E6"), HexColor("#021B79")];

  static var neumorphicStyleProject = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(
        BorderRadius.circular(20)),
    color: HexColor('#E1E5EC'),
    depth: 4,
    intensity: 0.8,
  );

  static var neumorphicStyleProjectRound = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(
        BorderRadius.circular(100)),
    color: HexColor('#E1E5EC'),
    depth: 4,
    intensity: 0.8,
  );

  static var neumorphicStyleProjectBlue = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(
        BorderRadius.circular(20)),
    color: HexColor('#E1E5EC'),
    // color: HexColor('#B8C6FF'),
    depth: 4,
    intensity: 0.8,
  );

  static var neumorphicStyleDepth = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(
        BorderRadius.circular(20)),
    color: HexColor('#E1E5EC'),
    depth: -4,
    intensity: 0.8,
  );

}/**/