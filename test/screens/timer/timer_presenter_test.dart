import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pomotoro/counter.dart';
import 'package:pomotoro/screens/timer/timer_presenter.dart';
import 'package:pomotoro/screens/timer/timer_view.dart';

class MockCounter extends Mock implements Counter {}

class MockView extends Mock implements TimerView {}

main() {
  var view = MockView();
  var counter = MockCounter();

  TimerPresenter presenter(){
    return TimerPresenter(view, counter);
  }

  group("constructor", () {
    setUpAll(() {
      presenter();
    });

    test("init play button text", () {
      verify(view.setPlayButtonText("Start"));
    });

    test("init count text", () {
      verify(view.setCountText(0));
    });
  });
}
