import 'package:flutter/material.dart';
import 'package:open_earable/apps/ufiiu/movementTracker.dart';
import 'package:open_earable/apps/ufiiu/sensor_datatypes.dart';

import 'interact.dart';

class TimerScreen extends StatefulWidget {
  final Interact interact;
  TimerScreen(this.interact);
  @override
  State<StatefulWidget> createState() => TimerScreenState(interact);

}


class TimerScreenState extends State<TimerScreen> {
  final Interact _interact;
  late final MovementTracker _movementTracker;
  //Input Controller
  final TextEditingController _controller = TextEditingController();

  //Display Text
  String _displayText = "Initial State";


  //Constructor
  TimerScreenState(this._interact) {
    this._movementTracker = MovementTracker(_interact);
  }

  //Set new display text
  void updateText(SensorDataType sensorData) {
    setState(() {
      _displayText =
             "X: " + sensorData.x.toString()
          + " Y: " + sensorData.y.toString()
          + " Z: " + sensorData.z.toString();
    });
  }



  //Widget Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bild deiner Wahl
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/198/198155.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),

            // Eingabefeld für Zeitlänge
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Zeitlänge eingeben (in Minuten)',
                ),
              ),
            ),
            SizedBox(height: 20),

            // Absende-Button
            ElevatedButton(
              onPressed: () {
                String input = _controller.text;

                // Die eingegebene Zeit in Minuten umwandeln (angenommen, dass es sich um eine gültige Zahl handelt)
                int minutes = int.tryParse(input) ?? 0;
                _movementTracker.start(minutes, updateText);


              },
              child: Text('Starten'),
            ),
            Text(
              _displayText,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  
}