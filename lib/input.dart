class Input {
  static final Input _singleton = Input._internal();

  factory Input() {
    return _singleton;
  }

  void pressButtonA() {}

  void pressButtonB() {}

  void pressButtonSelect() {}
  void pressButtonStart() {
    print("start");
  }

  void pressButtonUp() {}
  void pressButtonDown() {}
  void pressButtonLeft() {}
  void pressButtonRight() {}

  Input._internal();
}
