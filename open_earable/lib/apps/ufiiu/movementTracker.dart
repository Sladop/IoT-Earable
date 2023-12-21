import 'dart:async';

import 'package:open_earable/apps/ufiiu/interact.dart';
import 'package:open_earable/apps/ufiiu/time_manager.dart';
import 'package:open_earable_flutter/src/open_earable_flutter.dart';

class MovementTracker {
  final Interact _interact;
  late final OpenEarable _openEarable;
  late final TimeManager _timeManager;


  
  StreamSubscription<Map<String, dynamic>>? _subscription;

  bool get isTracking => _subscription != null && !_subscription!.isPaused;
  bool get isAvailable => _openEarable.bleManager.connected;

  MovementTracker(this._interact) {
    this._timeManager = TimeManager(_interact);
    this._openEarable = _interact.getEarable();
  }

  void start(int minutes) {
    if (_subscription?.isPaused ?? false) {
      _subscription?.resume();
      _timeManager.resetTimer(minutes);
      return;
    }

    _openEarable.sensorManager.writeSensorConfig(_buildSensorConfig());
    _subscription = _openEarable.sensorManager.subscribeToSensorData(0).listen((event) {
      _timeManager.updateTimer(
        roll: event["EULER"]["ROLL"],
        pitch: event["EULER"]["PITCH"],
        yaw: event["EULER"]["YAW"]
      );
    });
  }

  void stop() {
    _subscription?.pause();
    _timeManager.stopTimer();
  }

  OpenEarableSensorConfig _buildSensorConfig() {
    return OpenEarableSensorConfig(
      sensorId: 0,
      samplingRate: 30,
      latency: 0
    );
  }
}