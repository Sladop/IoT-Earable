import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Zeitlänge eingeben (in Sekunden)',
                ),
              ),
            ),
            SizedBox(height: 20),

            // Absende-Button
            ElevatedButton(
              onPressed: () {
                // Hier kannst du die Aktion hinzufügen, die bei Drücken des Buttons ausgeführt werden soll
                // Zum Beispiel: Starte den Timer oder führe andere Aktionen aus.
                print('Timer starten!');
              },
              child: Text('Starten'),
            ),
          ],
        ),
      ),
    );
  }
  
}