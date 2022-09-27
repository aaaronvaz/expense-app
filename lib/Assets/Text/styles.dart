import 'package:flutter/material.dart';

class styles {
  static const MaterialColor primarySwatch = Colors.green;
  // static const Color accentColor = Colors.lightGreen;

  static const TextStyle title = TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 20,
  );

  static const TextStyle emptyHeadline = TextStyle(
    color: Colors.red,
    fontSize: 30,
    fontFamily: 'Georgia',
  );

  static const TextStyle bottomscreenText = TextStyle(
    color: Colors.black,
    fontFamily: 'Georgia',
    fontSize: 18,
  );

  static const TextStyle bottomscreenLabel =
      TextStyle(color: Colors.green, fontSize: 15);
  static const TextStyle bottomscreenFloatLabel = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle listTileCost = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle barChartCost = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
}
