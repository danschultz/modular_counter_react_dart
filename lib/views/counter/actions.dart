part of counter_demo.counter;

Action<State> increment() {
  return (State state) => new State(state.id, state.count + 1);
}

Action<State> decrement() {
  return (State state) => new State(state.id, state.count - 1);
}
