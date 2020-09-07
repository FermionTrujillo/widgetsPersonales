import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:widgetspersonales/tema.dart';
import 'pages/principal_page.dart';
import 'providers/provider.dart';
import 'package:widgetspersonales/pages/tabs_page.dart';
import 'package:widgetspersonales/pages/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchTextFieldProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: tema(),
          home: PrincipalPage()),
    );
  }
}
