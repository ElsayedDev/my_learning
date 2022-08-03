import 'dart:ffi';

mixin SingleTickerProviderStateMixin<T extends StatefulWidget> on State<T> {
  void dispose2() {
    this.initState();
  }
}

class Widget {}

class BuildContext {}

class StatefulWidget extends Widget {}

class StatelessWidget extends Widget {}

abstract class State<T extends Widget> {
  void initState() {}

  Widget build(BuildContext context);

  void didChangeDependencies() {}
}

class B extends StatelessWidget {}

class AB extends StatefulWidget {}

class A extends State<AB> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  dispose2();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Widget();
  }
}

void main(List<String> args) {
  // Array<Int8> arr = Array<Int8>.multi([
  //   5,
  //   6,
  //   9,
  //   1,
  //   2,
  // ]);

  var arr = [5, 6, 6, 6, 9, 6, 6];
}
