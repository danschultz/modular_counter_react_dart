part of counter_demo.counter_list;

class State {
  final int nextId;
  final Iterable<counter.State> counters;

  State(this.nextId, this.counters);

  factory State.initial() => new State(0, []);
}
