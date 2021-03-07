import 'package:flutter/material.dart';

double horizontalPaddingPercent = 0.04;

EdgeInsets horizontalScaffoldPadding(BuildContext context) {
  final double width = MediaQuery.of(context).size.width;
  return EdgeInsets.symmetric(horizontal: width * horizontalPaddingPercent);
}

double horizontalPaddingSize(double width) {
  return (width * horizontalPaddingPercent) * 2;
}

double getWidgetWidth({double widgetsPerRow = 1, double width = 0}) {
  return width / widgetsPerRow;
}