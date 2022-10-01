abstract class IAlgo {
  execute(IProblem problem);
  time();
}

abstract class IProblem {}

class Problem extends IProblem {}

class Algo1 implements IAlgo {
  @override
  execute(IProblem problem) {
    /* 1 */
  }

  @override
  time() {}
}

class Algo2 implements IAlgo {
  @override
  execute(IProblem problem) {
    /* 2 */
  }

  @override
  time() {}
}

class Algo3 implements IAlgo {
  @override
  execute(IProblem problem) {
    /* 2 */
  }

  @override
  time() {}
}

class AlgoContext {
  IAlgo? _algo;

  setAlgoStrategy(IAlgo algo) {
    _algo = algo;
  }

  void execute(IProblem problem) {
    if (_algo != null) {
      _algo!.execute(problem);
    }
  }
}
