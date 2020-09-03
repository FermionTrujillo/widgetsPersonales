import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Stroked text as border.
        Text(
          'Greetings, planet! Viva el mejor Titancito del universo',
          style: TextStyle(
            fontSize: 18,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = Theme.of(context).primaryColor,
          ),
        ),
        // Solid text as fill.
        Text(
          'Greetings, planet! Viva el mejor Titancito del universo',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }
}
