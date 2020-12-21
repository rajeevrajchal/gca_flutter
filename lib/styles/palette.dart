import 'package:flutter/material.dart';

class Palette {
  static const Color scaffold = Color.fromRGBO(240,244,253,1);

  static const Color primary = Color.fromRGBO(90,85,202,1);
  static const Color secondaryButton = Color.fromRGBO(43,192,156,1);
  static const Color primaryButton = Color.fromRGBO(242,105,80,1);
  static const Color fav = Colors.pink;
  static const Color online = Color(0xFF4BCB1F);
  static const Color dark = Colors.black;
  static const Color light = Colors.white;


  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF496AE1), Color(0xFFCE48B1)],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
}
