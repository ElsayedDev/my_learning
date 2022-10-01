import 'package:flutter/foundation.dart';

abstract class StateBase {
  @protected
  late String initialState;

  @protected
  late String currentState;
  String get currentText => currentState;

  void setStateText(String state) {
    currentState = state;
  }

  void reset() {
    currentState = initialState;
  }
}

class XState extends StateBase {
  static final XState _instance = XState._internal();

  factory XState() => _instance;

  XState._internal() {
    initialState = "XState";
    currentState = initialState;
  }
}
