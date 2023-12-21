import 'dart:async';

import 'package:open_earable/apps/ufiiu/timerscreen.dart';

import '../interact.dart';

class TimeManager {

  final Interact interact;

  //Timer variables
  Timer? movementTimer;
  int _minutes = 0;

  //Constructor
  TimeManager(this.interact);

  /*
  Rings after the given time.
   */
  void _startTimerRing(int minutes) {
    _minutes = minutes;
    // Hier wird der Timer gestartet.
    movementTimer = Timer(Duration(minutes: minutes), () {
      // Timer abgelaufen, rufe _ring() auf.
      interact.ring();
    });
  }

  /*
  Resets the timer.
   */
  void resetTimer(int minutes) {
    // Hier wird der Timer zurückgesetzt.
    movementTimer?.cancel();
    _startTimerRing(minutes);
  }

  /*
  Stops the Timer.
   */
  void stopTimer() {
    movementTimer?.cancel();
  }

  /*
  Updates the Timer and the Text if threshhold reached.
   */
  void updateTimer({required roll, required pitch, required yaw}) {
    TimerScreenState.updateText(roll);
    print("Test Roll: " + roll.toString());
    if(roll > 10) {
      resetTimer(_minutes);
    }
  }

}