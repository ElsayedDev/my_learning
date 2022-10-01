import 'package:flutter/material.dart';

class Shape {
  late Color color;
  late double height;
  late double width;

  Shape.initial() {
    color = Colors.black;
    height = 150.0;
    width = 150.0;
  }
}

abstract class Command {
  void execute();
  String getTitle();
  void undo();
}
