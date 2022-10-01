import 'dart:async';

class StateContext {
  final StreamController<IState> _stateStream = StreamController<IState>();
  Sink<IState> get _inState => _stateStream.sink;
  late IState _currentState;

  Stream<IState> get outState => _stateStream.stream;

  StateContext() {
    _currentState = NoResultState();
    _addCurrentStateToStream();
  }
  _addCurrentStateToStream() {
    _inState.add(_currentState);
  }

  setState(IState state) {
    _currentState = state;
    _addCurrentStateToStream();
  }

  Future<void> nextState() async {
    unawaited(_currentState.nextState(this));

    if (_currentState is LoadingState) {
      unawaited(_currentState.nextState(this));
    }
  }

  dispose() {
    _stateStream.close();
  }
}

abstract class IState {
  nextState(StateContext context);
  task();
}

class NoResultState implements IState {
  @override
  nextState(StateContext context) {}

  @override
  task() {
    /* 1 */
  }
}

class ErrorState implements IState {
  @override
  nextState(StateContext context) {}

  @override
  task() {
    /* 2 */
  }
}

class LoadingState implements IState {
  @override
  nextState(StateContext context) {}

  @override
  task() {
    /* 3 */
  }
}

class LoadedState implements IState {
  @override
  nextState(StateContext context) {}

  @override
  task() {
    /* 4 */
  }
}
