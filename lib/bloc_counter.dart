import 'package:rxdart/subjects.dart';

class BlocCounter {
  BehaviorSubject<int> counter;
  Stream<String> numberType;
  BlocCounter() {
    counter = BehaviorSubject();
    numberType = counter.asyncMap((number) {
      if (number % 2 == 0) {
        return 'even';
      }
      return 'odd';
    });
  }
  dispose() {
    counter.close();
  }
}
