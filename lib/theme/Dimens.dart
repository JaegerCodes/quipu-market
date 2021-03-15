import 'package:flutter/material.dart';

double radius = 4.2;
double cardMenuRadius = 10;


double getWidgetWidth({double widgetsPerRow = 1, double width = 0}) {
  return width / widgetsPerRow;
}

BorderRadius borderRadius = BorderRadius.circular(radius);
