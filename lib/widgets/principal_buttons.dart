// El estilo de los botones de la pantalla principal, reciben un FaIcon, una
// acción y un iconSize

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GeneralButton extends StatelessWidget {
  final Function action;
  final FaIcon icon;
  final double iconSize;
  GeneralButton({this.action, this.icon, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Ink(
        decoration: BoxDecoration(
            //border: Border.all(color: Colors.white54, width: 1.0),
            //color: Color.fromRGBO(241, 255, 250, 0.3),
            shape: BoxShape.circle),
        child: Stack(children: <Widget>[
          IconButton(
            iconSize: iconSize + 1.5,
            icon: icon,
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            splashRadius: 1.0,
            iconSize: iconSize,
            icon: icon,
            color: Colors.white,
            onPressed: () {
              action();
            },
          )
        ]));
  }
}
