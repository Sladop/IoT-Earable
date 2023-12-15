import 'package:flutter/material.dart';

import 'interact.dart';

class TimerScreen extends StatelessWidget {
  final Interact _interact;
  final TextEditingController _controller = TextEditingController();

  TimerScreen(this._interact);

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

                // Die Interact.startTimer-Funktion aufrufen
                _interact.startTimer(minutes);
              },
              child: Text('Starten'),
            ),
          ],
        ),
      ),
    );
  }
  
}