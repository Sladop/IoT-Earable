import 'dart:async';

import 'package:open_earable/apps/ufiiu/interact.dart';
import 'package:open_earable/apps/ufiiu/sensor_datatypes.dart';
import 'package:open_earable/apps/ufiiu/timerscreen.dart';
import 'package:open_earable_flutter/src/open_earable_flutter.dart';
import 'package:three_dart_jsm/three_dart_jsm.dart';

class MovementTracker {
  final Interact _interact;
  late final OpenEarable _openEarable;

  Timer? _timer;


  //Stream Subscription
  StreamSubscription<Map<String, dynamic>>? _subscription;

  //Constructor
  MovementTracker(this._interact) {
    this._openEarable = _interact.getEarable();
  }

  //Start Subscription and reset timer.
  void start(int minutes, void Function(SensorDataType s) updateText) {

    print("Testing start");

    //Timer wird neugestartet.
    _startTimer(minutes);

    //Falls pausiert
    if (_subscription?.isPaused ?? false) {
      _subscription?.resume();
      print("if Case");
      return;
    }

    //Sets sensor config
    _openEarable.sensorManager.writeSensorConfig(_buildSensorConfig());

    //Starts listening to the subscription
    _subscription = _openEarable.sensorManager.subscribeToSensorData(0).listen((event) {

      //Update method
      updateText(Gyroscope(event));

      _update(Gyroscope(event));
    });
  }

  //Startet den Timer.
  void _startTimer(int minutes) {
    _timer = Timer(Duration(minutes: minutes), () {
      // Timer abgelaufen, rufe _ring() auf.
      _interact.ring();
      stop();
    });
  }

  //Stoppt timer + Subscription
  void stop() {

    print("Stop");
    _timer?.cancel();
    _subscription?.pause();
  }


  void _update(SensorDataType dt) {
    print("Update...");
  }

  //Sensor Config
  OpenEarableSensorConfig _buildSensorConfig() {
    return OpenEarableSensorConfig(
      sensorId: 0,
      samplingRate: 30,
      latency: 0
    );
  }
}