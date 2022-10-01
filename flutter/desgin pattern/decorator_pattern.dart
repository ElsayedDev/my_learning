import 'package:flutter/foundation.dart';

class PizzMenu {}

abstract class Pizza {
  @protected
  late String description;

  String getDescription();
  double getPrice();
}

class PizzaBase extends Pizza {
  PizzaBase(String description) {
    this.description = description;
  }

  @override
  String getDescription() => description;

  @override
  double getPrice() => 3.0;
}

abstract class PizzaDecorator extends Pizza {
  final Pizza pizza;
  PizzaDecorator(this.pizza);

  @override
  String getDescription() => pizza.getDescription();

  @override
  double getPrice() => pizza.getPrice();
}
