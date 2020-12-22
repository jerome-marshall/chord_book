import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Scale {

  List<String> scaleList;

  // static String dim = String.fromCharCode(119212);
  // static String sharp = String.fromCharCode(9839);
  // static String flat = String.fromCharCode(9837);

  static String dim = '^';
  static String sharp = '\$';
  static String flat = '%';

  void setScale(String scale, String mode) {
    if (mode == 'maj') {
      this.scaleList = _majorScales[scale];
    } else if (mode == 'm') {
      this.scaleList = _minorScales[scale];
    }
  }

  Map _minorScales = {
    'C': ['Cm', 'D$dim', 'E$flat', 'Fm', 'Gm', 'A$flat', 'B$flat'],

    'C$sharp': ['C$sharp''m', 'D$sharp$dim', 'E', 'F$sharp''m', 'G$sharp' 'm', 'A', 'B'],
    'D$flat': ['D$flat''m', 'E$flat$dim', 'E', 'G$flat''m', 'A$flat''m', 'A', 'B'],

    'D': ['Dm', 'E$dim', 'F', 'Gm', 'Am', 'B$flat', 'C'],

    'D$sharp': ['D$sharp''m', 'F$dim', 'F$sharp', 'G$sharp''m', 'A$sharp''m', 'B', 'C$sharp'],
    'E$flat': ['E$flat''m', 'F$dim', 'G$flat', 'A$flat''m', 'B$flat''m', 'B', 'D$flat'],

    'E': ['Em', 'F$sharp$dim', 'G', 'Am', 'Bm', 'C', 'D'],

    'F': ['Fm', 'G$dim', 'A$flat', 'B$flat' 'm', 'Cm', 'D$flat', 'E$flat'],

    'F$sharp': ['F$sharp''m', 'G$sharp$dim', 'A', 'Bm', 'C$sharp' 'm', 'D', 'E'],
    'G$flat': ['G$flat''m', 'A$flat$dim', 'A', 'Bm', 'D$flat''m', 'D', 'E'],

    'G': ['Gm', 'A$dim', 'B$flat', 'Cm', 'Dm', 'E$flat', 'F'],

    'G$sharp': ['G$sharp''m', 'A$sharp$dim', 'B', 'C$sharp' 'm', 'D$sharp''m', 'E', 'F$sharp'],
    'A$flat': ['A$flat''m', 'B$flat$dim', 'B', 'D$flat''m', 'E$flat''m', 'E', 'G$flat'],

    'A': ['Am', 'B$dim', 'C', 'Dm', 'Em', 'F', 'G'],

    'A$sharp': ['A$sharp''m', 'C$dim', 'C$sharp', 'D$sharp''m', 'Fm', 'F$sharp', 'G$sharp'],
    'B$flat': ['B$flat''m', 'C$dim', 'D$flat', 'E$flat''m', 'Fm', 'G$flat', 'A$flat'],

    'B': ['Bm', 'C$sharp$dim', 'D', 'Em', 'F$sharp' 'm', 'G', 'A'],
  };


  Map _majorScales = {
    'C': ['C', 'Dm', 'Em', 'F', 'G', 'Am', 'B$dim'],

    'C$sharp': ['C$sharp', 'D$sharp''m', 'Fm', 'F$sharp', 'G$sharp', 'A$sharp''m', 'C$dim'],
    'D$flat': ['D$flat', 'E$flat''m', 'Fm', 'G$flat', 'A$flat', 'B$flat''m', 'C$dim'],

    'D': ['D', 'Em', 'F$sharp''m', 'G', 'A', 'Bm', 'C$sharp$dim'],

    'D$sharp': ['D$sharp', 'Fm', 'Gm', 'G$sharp', 'A$sharp', 'Cm', 'D$dim'],
    'E$flat': ['E$flat', 'F' 'm', 'Gm', 'A$flat', 'B$flat', 'C' 'm', 'D$dim'],

    'E': ['E', 'F$sharp' 'm', 'G$sharp' 'm', 'A', 'B', 'C$sharp''m', 'D$sharp$dim'],

    'F': ['F', 'Gm', 'Am', 'B$flat', 'C', 'Dm', 'E$dim'],

    'F$sharp': ['F$sharp', 'G$sharp''m', 'A$sharp''m', 'B', 'C$sharp', 'D$sharp''m', 'F$dim'],
    'G$flat': ['G$flat', 'A$flat''m', 'B$flat''m', 'B', 'D$flat', 'E$flat''m', 'F$dim'],

    'G': ['G', 'Am', 'Bm', 'C', 'D', 'Em', 'F$sharp$dim'],

    'G$sharp': ['G$sharp', 'A$sharp''m', 'Cm', 'C$sharp', 'D$sharp', 'Fm', 'G$dim'],
    'A$flat': ['A$flat', 'B$flat''m', 'Cm', 'D$flat', 'E$flat', 'Fm', 'G$dim'],

    'A': ['A', 'Bm', 'C$sharp''m', 'D', 'E', 'F$sharp' 'm', 'G$sharp$dim'],

    'A$sharp': ['A$sharp', 'Cm', 'Dm', 'D$sharp', 'F', 'Gm', 'A$dim'],
    'B$flat': ['B$flat', 'Cm', 'Dm', 'E$flat', 'F', 'Gm', 'A$dim'],

    'B': ['B', 'C$sharp' 'm', 'D$sharp' 'm', 'E', 'F$sharp', 'G$sharp''m', 'A$sharp$dim'],
  };

  Map transScaleMap = {
    0: 'C',
    1: 'C$sharp',
    2: 'D',
    3: 'E$flat',
    4: 'E',
    5: 'F',
    6: 'F$sharp',
    7: 'G',
    8: 'A$flat',
    9: 'A',
    10: 'B$flat',
    11: 'B',
  };

  int getScaleNumber(String scale) => transScaleMap.keys.firstWhere((k) => transScaleMap[k] == scale, orElse: () => null);

  String getScale(int key) => transScaleMap.values.firstWhere((element) => transScaleMap[key] == element, orElse: () => null);
}
