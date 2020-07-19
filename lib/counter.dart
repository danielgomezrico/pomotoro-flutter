import 'dart:async';

class Counter {
  Timer _timer;
  var _count = 0;

  get count => _count;

  void start(Function(int count) onTick) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _count += 1;
      onTick(count);
    });
  }

  void stop() {
    _timer.cancel();
  }
}
