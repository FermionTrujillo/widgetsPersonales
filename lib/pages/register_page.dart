import 'package:flutter/material.dart';

class PruebaPage extends StatefulWidget {
  @override
  _PruebaPageState createState() => _PruebaPageState();
}

class _PruebaPageState extends State<PruebaPage> {
  bool muestraBoton = false;
  bool muestraDosBotones = false;

  @override
  Widget build(BuildContext context) {
    if (muestraBoton) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.yellow[100],
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () {
              print('muestraboton');
              setState(() {
                muestraBoton = !muestraBoton;
              });
            },
            onDoubleTap: () {
              print('muestra dos botones');
              setState(() {
                muestraDosBotones = !muestraDosBotones;
              });
            },
            child: Stack(children: [
              Container(
                padding: EdgeInsets.only(top: 31),
                width: double.infinity,
                height: double.infinity,
                child: Image.asset('assets/images/edificioplantas.jpg',
                    fit: BoxFit.fitWidth),
              ),
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Theme.of(context).accentColor,
                ),
              ),
              Center(
                child: Text('asdasdsa'),
              )
            ]),
          ),
        ),
      );
    } else if (muestraDosBotones) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.yellow[100],
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () {
              print('muestraboton');
              setState(() {
                muestraBoton = !muestraBoton;
              });
            },
            onDoubleTap: () {
              print('muestra dos botones');
              setState(() {
                muestraDosBotones = !muestraDosBotones;
              });
            },
            child: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.yellow[100],
              ),
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(),
        body: GestureDetector(
          onTap: () {
            print('muestraboton');
            setState(() {
              muestraBoton = !muestraBoton;
            });
          },
          onDoubleTap: () {
            print('muestra dos botones');
            setState(() {
              muestraDosBotones = !muestraDosBotones;
            });
          },
          child: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red[100],
            ),
          ),
        ),
      ),
    );
  }
}

class MiniHeroPage extends StatefulWidget {
  @override
  _MiniHeroPageState createState() => _MiniHeroPageState();
}

class _MiniHeroPageState extends State<MiniHeroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Theme.of(context).accentColor,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/edificioplantas.jpg',
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
