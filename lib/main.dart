import 'package:flutter/material.dart';

import 'package:widgetspersonales/tema.dart';
import 'pages/principal_page.dart';
import 'package:widgetspersonales/pages/tabs_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: tema(),
      home: PrincipalPage(),
    );
  }
}
