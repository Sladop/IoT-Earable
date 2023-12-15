import 'dart:async';

import 'package:open_earable_flutter/src/open_earable_flutter.dart';

class Interact {
  final OpenEarable _openEarable;

  Interact(this._openEarable) {
  }

  void startTimer(int minutes) {
    Timer(Duration(milliseconds: (minutes * 60 * 1000)) as Duration, _ring);
  }

  void _ring() {
    try {
      _openEarable.audioPlayer.jingle(1);
    } catch (e) {
      print('Jingle konnte nicht gespielt werden!');
    }
  }
}