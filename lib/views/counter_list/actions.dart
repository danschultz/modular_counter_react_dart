part of counter_demo.counter_list;

Action<State> createCounter() {
  return (State state) {
    var newCounter = new counter.State(state.nextId, 0);
    var counters = state.counters.toList()..insert(0, newCounter);
    return new State(state.nextId + 1, counters);
  };
}

Action<State> removeCounter(int id) {
  return (State state) {
    var counters = state.counters.toList()..removeWhere((state) {
      return state.id == id;
    });
    return new State(state.nextId, counters);
  };
}

Action<State> updateCounter(int id, Action<counter.State> action) {
  return (State state) {
    var counters = state.counters.map((state) {
      return state.id == id ? action(state) : state;
    });
    return new State(state.nextId, counters);
  };
}
