import 'package:flutter/material.dart';

dynamic tema() {
  return ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: colorCustomMorado[900],
    accentColor: colorCustomAzul[900],
    errorColor: colorCustomRojo[900],
    primarySwatch: colorCustomMorado,

    // default font family.
    fontFamily: 'Roboto',
    // text styles
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}

Map<int, Color> colorMorado = {
  900: Color.fromRGBO(24, 10, 48, 1.0),
};

MaterialColor colorCustomMorado = MaterialColor(0x180a30, colorMorado);

Map<int, Color> colorAzul = {
  900: Color.fromRGBO(66, 129, 164, 1.0),
};

MaterialColor colorCustomAzul = MaterialColor(0x4281a4, colorAzul);

Map<int, Color> colorRojo = {
  900: Color.fromRGBO(232, 72, 85, 1.0),
};

MaterialColor colorCustomRojo = MaterialColor(0xe84855, colorRojo);

//style: Theme.of(context).textTheme.headline6
