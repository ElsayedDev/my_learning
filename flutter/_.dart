main() {}

mixin SingleTickerProviderStateMixin<T extends StatefulWidget> on State<T> {}

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Widget();
  }
}
