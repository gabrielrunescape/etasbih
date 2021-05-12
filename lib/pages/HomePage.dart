import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int rounds = 0;
  int general = 0;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragDown: (details) {
        double half = MediaQuery.of(context).size.width / 2;

        if (details.localPosition.dx > half) {
          setState(() {
            general++;
            _counter++;

            if (_counter > 33) {
              rounds++;
              _counter = 0;
            }
          });
        } else if (details.globalPosition.dx < half) {
          setState(() {
            general--;
            _counter--;

            if (_counter < 0) {
              _counter = 0;
              if (general > 0 && rounds > 0) {
                rounds--;
              }
            }
          });
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Vi multfoje premis la butonon:',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Vi prenis $rounds rondirojn',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
