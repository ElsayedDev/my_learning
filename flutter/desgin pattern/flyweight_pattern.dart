enum ShapeType { Circle, Square, Rectangle }

abstract class IPositionShape {
  render(double x, double y);
}

abstract class ShapeUIStyle {
  String get color => "";
  String get border => "";
  String get background => "";

  void styleWidget(String child) {}
}

class Circle extends ShapeUIStyle implements IPositionShape {
  final String color;
  final double radius;

  Circle(this.color, this.radius);

  @override
  render(double x, double y) {
    styleWidget("Circle");
    print("Circle: Draw() [Color : $color, x : $x, y :$y, radius : $radius");
  }
}

class Square implements IPositionShape {
  final String color;
  final double side;

  Square(this.color, this.side);

  @override
  render(double x, double y) {
    print("Square: Draw() [Color : $color, x : $x, y :$y, side : $side");
  }
}
