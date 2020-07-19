import 'package:pomotoro/counter.dart';
import 'package:pomotoro/screens/timer/timer_view.dart';

class TimerPresenter {
  TimerView _view;
  Counter _counter;
  bool _isCounting = false;

  TimerPresenter(this._view, this._counter) {
    _updatePlayButtonText();
    _updateCountText(0);
  }

  void detach() {
    _view = null;
  }

  void onPlayClick() {
    if (_isCounting) {
      _counter.stop();
    } else {
      _counter.start((count) => _updateCountText(count));
    }

    _isCounting = !_isCounting;

    _updatePlayButtonText();
  }

  void _updateCountText(int count) => _view.setCountText(count);

  void _updatePlayButtonText() {
    var text = _isCounting ? "Stop" : "Start";
    _view.setPlayButtonText(text);
  }
}
