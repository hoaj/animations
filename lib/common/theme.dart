import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primarySwatch: Colors.blue,
);

final decoration = BoxDecoration(
  boxShadow: [
    BoxShadow(color: themeData.shadowColor, blurRadius: 5.0),
  ],
  borderRadius: BorderRadius.circular(25),
  color: themeData.cardColor,
);
