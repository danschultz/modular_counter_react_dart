part of counter_demo.framework;

class Channel<T> implements StreamController<T> {
  final StreamController<T> _controller;

  Channel._(StreamController<T> controller) : _controller = controller;

  factory Channel({bool sync: false}) =>
      new Channel._(new StreamController(sync: sync));

  factory Channel.broadcast({bool sync: false}) =>
      new Channel._(new StreamController.broadcast(sync: sync));

  EventStream<T> get stream => new EventStream(_controller.stream);
  StreamSink<T> get sink => _controller.sink;
  bool get isClosed => _controller.isClosed;
  bool get isPaused => _controller.isPaused;
  bool get hasListener => _controller.hasListener;
  Future get done => _controller.done;

  Future close() => _controller.close();

  void add(T event) => _controller.add(event);

  Future addStream(Stream<T> source, {bool cancelOnError: true}) =>
      _controller.addStream(source, cancelOnError: cancelOnError);

  void addError(Object error, [StackTrace stackTrace]) =>
      _controller.addError(error, stackTrace);

  call(T event) => add(event);
}
