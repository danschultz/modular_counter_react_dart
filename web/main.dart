import 'dart:html';
import 'package:counter_demo/framework.dart';
import 'package:counter_demo/views/counter_list.dart' as counter_list;
import 'package:react/react.dart' as react;
import 'package:react/react_client.dart' as react_client;

void main() {
  react_client.setClientConfiguration();

  var applicationElement = querySelector("#application");

  var initialState = new counter_list.State.initial();
  var actions = new Channel<Action<counter_list.State>>();
  var state = actions.stream.scan(initialState, (state, action) => action(state));

  state.listen((state) {
    var view = counter_list.view({"actions": actions, "state": state});
    react.render(view, applicationElement);
  });
}
