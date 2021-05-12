import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: layoutArea(context));
  }

  Widget layoutArea(BuildContext context) {
    Duration duration = Duration(milliseconds: 250);
    double width = MediaQuery.of(context).size.width;
    double height = (MediaQuery.of(context).size.height - 100) / 2;

    Row child = Row(
      children: selected
          ? [
              Image(image: AssetImage("assets/green_bead.png")),
              Image(image: AssetImage("assets/green_bead.png")),
            ]
          : [
              Image(image: AssetImage("assets/green_bead.png")),
              Image(image: AssetImage("assets/green_bead.png")),
            ],
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              child: child,
              bottom: height,
              duration: duration,
              left: selected ? -50 : -150,
            ),
            AnimatedPositioned(
              child: child,
              bottom: height,
              duration: duration,
              right: selected ? -150 : -50,
            ),
            AnimatedPositioned(
              top: height,
              duration: duration,
              child: Image.asset("assets/gray_bead.png"),
              left: selected ? (width - 150) : 50,
            ),
          ],
        ),
      ),
    );
  }
}
