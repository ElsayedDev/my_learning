class BurgerMaker {
  final BurgerBuilderBase burgerBuilderBase;

  BurgerMaker(this.burgerBuilderBase);
}

abstract class BurgerBuilderBase {
  final Burger burger;
  final double price;
  const BurgerBuilderBase(this.burger, this.price);

  createBurger();
  addIngredient(Ingredient ingredient);
  addBun();
  addPatty();
  addSauce();
}

class BigMacBuilder extends BurgerBuilderBase {
  const BigMacBuilder()
      : super(
          const Burger(
            price: 0.0,
            ingredients: [],
          ),
          5.0,
        );

  @override
  addBun() {
    // return
  }

  @override
  addIngredient(Ingredient ingredient) {
    // TODO: implement addIngredient
    throw UnimplementedError();
  }

  @override
  addPatty() {
    // TODO: implement addPatty
    throw UnimplementedError();
  }

  @override
  addSauce() {
    // TODO: implement addSauce
    throw UnimplementedError();
  }

  @override
  createBurger() {
    // TODO: implement createBurger
    throw UnimplementedError();
  }
}

abstract class Ingredient {
  final String name;
  final double price;

  const Ingredient(this.name, this.price);

  List<String> getAllergens();
  String getName();
}

class Cheese extends Ingredient {
  Cheese() : super('Cheese', 1.0);

  @override
  List<String> getAllergens() {
    return ['Lactose'];
  }

  @override
  String getName() {
    return 'Cheese';
  }
}

class Tomato extends Ingredient {
  Tomato() : super('Tomato', 0.5);

  @override
  List<String> getAllergens() {
    return ['None'];
  }

  @override
  String getName() {
    return 'Tomato';
  }
}

class GrillSeasoning extends Ingredient {
  GrillSeasoning() : super('GrillSeasoning', 0.5);

  @override
  List<String> getAllergens() {
    return ['None'];
  }

  @override
  String getName() {
    return 'GrillSeasoning';
  }
}

class Burger {
  final List<Ingredient> ingredients;
  final double price;

  const Burger({required this.ingredients, required this.price});
}
