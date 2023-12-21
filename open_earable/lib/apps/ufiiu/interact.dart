import 'dart:async';

import 'package:open_earable_flutter/src/open_earable_flutter.dart';

class Interact {

  final OpenEarable _openEarable;

  //Constructor
  Interact(this._openEarable);


  //Getter for the Earable
  OpenEarable getEarable() {
    return _openEarable;
  }


  /*
  Lets the OpenEarable play the jingel one.
   */
  void ring() {
    try {
      _openEarable.audioPlayer.jingle(1);
    } catch (e) {
      print('Jingle konnte nicht gespielt werden!');
    }
  }
}