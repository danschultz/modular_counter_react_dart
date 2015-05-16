part of counter_demo.counter;

var view = registerComponent(() => new View());

class View extends Component {
  Channel<Action<State>> get _actions => props["actions"];
  State get _state => props["state"];

  render() {
    return div({}, [
      div({}, _state.count),
      button({"onClick": (_) => _actions.add(decrement())}, "Decrement"),
      button({"onClick": (_) => _actions.add(increment())}, "Increment")
    ]);
  }
}
