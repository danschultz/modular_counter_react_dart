part of counter_demo.counter_list;

var view = registerComponent(() => new View());

class View extends Component {
  Channel<Action<State>> get _actions => props["actions"];
  State get _state => props["state"];

  render() {
    var counters = _state.counters.map((state) => _renderCounter(state));
    return div({}, [
      button({"onClick": (_) => _actions.add(createCounter())}, "Create a Counter"),
      ul({}, counters)
    ]);
  }

  _renderCounter(counter.State state) {
    var counterActions = new Channel();
    counterActions.stream.listen((action) {
      _actions.add(updateCounter(state.id, action));
    });

    return div({}, [
      counter.view({"actions": counterActions, "state": state}),
      button({"onClick": (_) => _actions.add(removeCounter(state.id))}, "Remove")
    ]);
  }
}
