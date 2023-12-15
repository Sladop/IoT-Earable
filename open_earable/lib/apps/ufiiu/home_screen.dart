import 'package:flutter/material.dart';
import 'package:open_earable/apps/ufiiu/timerscreen.dart';
import 'package:open_earable_flutter/src/open_earable_flutter.dart';

import 'interact.dart';

class SleepHomeScreen extends StatefulWidget {
  final OpenEarable _openEarable;
  SleepHomeScreen(this._openEarable);
  @override
  _HomeScreenState createState() => _HomeScreenState(_openEarable);
}

class _HomeScreenState extends State<SleepHomeScreen> {
  final OpenEarable _openEarable;
  _HomeScreenState(this._openEarable);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return Center(
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/512/198/198155.png',
            width: 150,
            height: 150,
          ),

        );
      case 1:
        return Center(
          child: Text('Wird weitergeleitet...')
        );
      case 2:
        return Center(
          child: Text('Diese Sub-App wurde entwickelt von: Philipp Ochs, Matrikelnummer 2284828'),
        );
      default:
        return Center(
          child: Text('Ungültiger Index'),
        );

    }
    return Container();
  }
  void _onNavBarItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TimerScreen(Interact(_openEarable)),
          ),
        );
      }
    });
  }
}