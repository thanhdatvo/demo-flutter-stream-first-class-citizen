class Event {}

class EventStart extends Event {
  @override
  String toString() {
    return "Start calculating";
  }
}

class EventSuccess extends Event {
  final dynamic _data;
  EventSuccess(this._data);
  @override
  String toString() {
    return "Success with even number: $_data";
  }
}

class EventFailure extends Event {
  final dynamic _error;
  EventFailure(this._error);
  @override
  String toString() {
    return "Failure with error: $_error";
  }
}
