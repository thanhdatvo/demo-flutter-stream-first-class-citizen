import 'package:example/event.dart';
import 'package:rxdart/subjects.dart';

class BlocEvent {
  BehaviorSubject<int> input;
  Stream<Event> event;
  BlocEvent() {
    input = BehaviorSubject();
    event = input.stream.asyncExpand(_mapStream).asBroadcastStream();
  }

  Stream<Event> _mapStream(dynamic input) async* {
    yield EventStart();

    await Future.delayed(Duration(seconds: 1));

    int data = input + 1;

    if (data % 2 == 0) {
      yield EventSuccess(data);
      return;
    }
    
    yield EventFailure("number is odd");
  }

  dispose() {
    input.close();
    event.drain();
  }
}
