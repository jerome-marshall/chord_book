import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Scale {

  List<String> scaleList;

  static String dim = String.fromCharCode(119212);
  static String sharp = String.fromCharCode(9839);
  static String flat = String.fromCharCode(9837);

  void setScale(String scale, String mode) {
    if (mode == 'maj') {
      this.scaleList = _majorScale[scale];
    } else if (mode == 'm') {
      this.scaleList = _minorScale[scale];
    }
  }

  Map _minorScale = {
    'C': ['Cm', 'D$dim', 'E$flat', 'Fm', 'Gm', 'A$flat', 'B$flat'],
    'D': ['Dm', 'E$dim', 'F', 'Gm', 'Am', 'B$flat', 'C'],
    'E': ['Em', 'F$sharp$dim', 'G', 'Am', 'Bm', 'C', 'D', 'm'],
    'F': ['Fm', 'G$dim', 'A$flat', 'B$flat' 'm', 'Cm', 'D$flat', 'E$flat'],
    'G': ['Gm', 'A$dim', 'B$flat', 'Cm', 'Dm', 'E$flat', 'F'],
    'A': ['Am', 'B$dim', 'C', 'Dm', 'Em', 'F', 'G'],
    'B': ['Bm', 'C$sharp$dim', 'D', 'Em', 'F$sharp' 'm', 'G', 'A'],
  };

  Map _majorScale = {
    'C': ['C', 'Dm', 'Em', 'F', 'G', 'Am', 'B$dim'],
    'Db': ['D$flat', 'E$flat''m', 'F' 'm', 'G$flat', 'A$flat', 'B$flat''m', 'C$dim'],
    'D': ['D', 'Em', 'F$sharp' 'm', 'G', 'A', 'B' 'm', 'C$sharp$dim'],
    'Eb': ['E$flat', 'F' 'm', 'G' 'm', 'A$flat', 'B$flat', 'C' 'm', 'D$dim'],
    'E': ['E', 'F$sharp' 'm', 'G$sharp' 'm', 'A', 'B', 'C$sharp' 'm', 'D$sharp$dim'],
    'F': ['F', 'Gm', 'Am', 'B$flat', 'C', 'Dm', 'E$dim'],
    'Gb': ['G$flat', 'A$flat''m', 'B$flat''m', 'B', 'D$flat', 'E$flat''m', 'F$dim'],
    'G': ['G', 'Am', 'Bm', 'C', 'D', 'Em', 'F$sharp$dim'],
    'Ab': ['A$flat', 'B$flat''m', 'C' 'm', 'D$flat', 'E$flat', 'F' 'm', 'G$dim'],
    'A': ['A', 'Bm', 'C$sharp' 'm', 'D', 'E', 'F$sharp' 'm', 'G$sharp$dim'],
    'Bb': ['B$flat', 'C' 'm', 'D' 'm', 'E$flat', 'F', 'G' 'm', 'A$dim'],
    'B': ['B', 'C$sharp' 'm', 'D$sharp' 'm', 'E', 'F$sharp', 'G$sharp' 'm', 'A$sharp$dim'],
  };
}
