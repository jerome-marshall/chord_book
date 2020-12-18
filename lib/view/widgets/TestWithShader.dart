import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextWithShader extends StatelessWidget {
  final String text;
  final List<Color> colorList;
  final TextStyle style;

  TextWithShader({this.text, this.colorList, this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        final gradient = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colorList,
        );
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: AutoSizeText(
        text,
        style: style,
        maxLines: 1,
      ),
    );
  }
}