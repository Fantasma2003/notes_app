import 'package:flutter/material.dart';

class ContainerColorHelper {
  static Color colorHelper(int index) {
    switch(index % 4) {
      case 0: return Colors.greenAccent; break;
      case 1: return Colors.yellowAccent; break;
      case 2: return Colors.pinkAccent; break;
      case 3: return Colors.purpleAccent; break;
      default: return Colors.black45;
    }
  }
}