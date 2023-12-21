import 'dart:async';

import 'interact.dart';

class TimeManager {

  Interact interact;
  int _minutes = 0;

  TimeManager(this.interact) {

  }

  Timer? movementTimer;

  void _startTimerRing(int minutes) {
    _minutes = minutes;
    // Hier wird der Timer gestartet.
    movementTimer = Timer(Duration(minutes: minutes), () {
      // Timer abgelaufen, rufe _ring() auf.
      interact.ring();
    });
  }

  void resetTimer(int minutes) {
    // Hier wird der Timer zurückgesetzt.
    movementTimer?.cancel();
    _startTimerRing(minutes);
  }

  void stopTimer() {
    movementTimer?.cancel();
  }

  void updateTimer({required roll, required pitch, required yaw}) {
    if(roll > 10) {
      resetTimer(_minutes);
    }
  }

}