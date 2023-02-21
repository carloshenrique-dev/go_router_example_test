import 'dart:async';

class BackgroundService {
  Timer? _timer;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      task();
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  task() {
    print('oi');
  }
}
