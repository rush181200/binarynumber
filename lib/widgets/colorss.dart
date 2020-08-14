import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

MaterialColor myColor = MaterialColor(0xFF880E4F, color);

Map<int, Color> color = {
  50: Hexcolor('#7289da'), //lightindigo
  100: Hexcolor('#FFFFFF'), //white
  200: Hexcolor('#2C2F33'), //dark but not dark black
  300: Hexcolor('#23272A'), //not quite black
  500: Colors.grey[600], //grey
  600: Colors.redAccent[400],
  700: Colors.red,
  800: Colors.green[300]
};
