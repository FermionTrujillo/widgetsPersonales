import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgetspersonales/widgets/principal_buttons.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  double _valorSlider = 100.0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 31),
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/edificioplantas.jpg',
                fit: BoxFit.fitWidth),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Container(
                  height: 100,
                  width: double.maxFinite,
                  color: Colors.yellow,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 15.0, bottom: 30.0),
                    alignment: Alignment.center,
                    child: GeneralButton(
                        icon: FaIcon(
                          FontAwesomeIcons.star,
                        ),
                        iconSize: 34,
                        action: () {}),
                  ),
                ),
                _crearSlider()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Slider(
        activeColor: Colors.red,
        label: 'Tamaño de la imagen',
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (false)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              },
      ),
    );
  }
}

class CuadradoAmarillo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        color: Colors.yellow,
      ),
    );
  }
}

class CuadradoAzul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.blue,
      ),
    );
  }
}
