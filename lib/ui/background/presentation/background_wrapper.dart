import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  const BackgroundWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(28, 255, 255, 1.0),
            Color.fromRGBO(30, 141, 203, 1.0),
          ]
        )
        // image: DecorationImage(
        //   image: AssetImage("assets/background/background.png"),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: child,
    );
  }
}
