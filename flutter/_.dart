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

class Node<T> {
  Node({required this.value, this.next});
  final T value;
  Node<T>? next;

  @override
  String toString() => 'Node($value)';
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    if (isEmpty) {
      push(value);
    } else {
      tail!.next = Node(value: value, next: null);
      tail = tail!.next;
    }
  }

  Node<E>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }

    return currentNode;
  }

  void insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
    }

    node.next = Node(value: value, next: node.next);
  }

  void pop() {
    /* 

  
  [value, NEXT1] => [value, NEXT2] => [value, NEXT3] => [value, NEXT4] => null 

                    ^head                                        
                                                        ^tail            

    */
    head = head?.next;

    //

    if (isEmpty) {
      tail = null;
    }
  }

  removeLast() {
    if (head?.next == null) {
      return pop();
    }
  }

  @override
  String toString() {
    if (isEmpty) return 'LinkedList()';
    var buffer = StringBuffer('LinkedList(');
    var node = head;
    while (node != null) {
      buffer.write('${node.value}, ');
      node = node.next;
    }
    buffer.write(')');
    return buffer.toString();
  }
}

void main(List<String> args) {
  var list = LinkedList<int>();
  list.append(10);
  list.append(20);
  list.append(30);
  var middleNode = list.nodeAt(1)!;

  list.insertAfter(middleNode, 100000);

  print(list.toString());
}
