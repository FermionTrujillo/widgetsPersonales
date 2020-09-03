import 'package:flutter/material.dart';

class TabuusPage extends StatelessWidget {
  static final controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mateapp',
      home: Scaffold(
        body: PageView(
          controller: controller,
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue,
            ),
            PageView(scrollDirection: Axis.vertical, children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.red,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.yellow,
              ),
            ]),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
