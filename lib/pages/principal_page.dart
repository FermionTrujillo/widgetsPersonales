//_____________________________Página Principal_________________________________
//
//   Desde esta página se controla todo. Con el PageView horizonal navegas desde
// la página donde se muestra el Post inicial a la siguiente y a la página de
// subir un Post. Desde la página del Post ves inicialmente la versión simple y
// al hacer tap ves la versión entera (fullMode), al hacer doble tap en versión
// simple ves el botón de pausa y la barra de progreso del vídeo. La página de
// ver un Post tiene un PageView vertical que te lleva a la página de chat con
// el usuario del Post.
//   Para componer las dos versiones de la Main Screen tenemos los widgets:
// Top, Middle, Report, Bottom, SimpleTop, SimpleMiddle y SimpleBottom Rows.
//   Los botones están definidos en la carpeta widgets/, aquí están las
// funciones de cada uno.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:widgetspersonales/pages/chat_page.dart';
import 'package:widgetspersonales/pages/upload_page.dart';
import 'package:widgetspersonales/widgets/principal_appbar.dart';

import 'package:widgetspersonales/widgets/principal_buttons.dart';
import 'package:widgetspersonales/widgets/text_widgets.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  bool fullMode = true;
  bool detailMode = true;
  static final horizontalController = PageController(
    initialPage: 1,
  );
  double _valorSlider = 100.0;

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: horizontalController,
        physics: ClampingScrollPhysics(),
        children: [
          UploadPage(),
          PageView(scrollDirection: Axis.vertical, children: [
            if (fullMode)
              Scaffold(
                  body: GestureDetector(
                onDoubleTap: () {
                  setState(() => fullMode = !fullMode);
                }, // para que lo reconozca y no haga nada
                onTap: () {
                  setState(() => fullMode = !fullMode);
                },
                //-----STACK Y APPBAR PERSONALIZADO------------
                child: SafeArea(
                    child: Stack(children: [
                  Scaffold(),
                  Container(
                    padding: EdgeInsets.only(top: 31),
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset('assets/images/edificioplantas.jpg',
                        fit: BoxFit.fitWidth),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        CustomAppBar(),
                        TopRow(),
                        Expanded(child: MiddleRow()),
                        ThirdStarRow(),
                        ReportRow(),
                        BottomRow(),
                      ],
                    ),
                  )
                ])),
              ))
            else if (detailMode)
              GestureDetector(
                  onDoubleTap: () {
                    setState(() => detailMode = !detailMode);
                  },
                  onTap: () {
                    setState(() => fullMode = !fullMode);
                  },
                  child: Stack(children: [
                    Scaffold(),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset('assets/images/edificioplantas.jpg',
                          fit: BoxFit.fitWidth),
                    ),
                    SafeArea(
                        child: Material(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          SimpleTopRow(),
                          OnlyPauseRow(),
                          ThirdStarRow(),
                          SecondStarRow(),
                          SimpleBottomRow(),
                          _crearSlider(),
                        ],
                      ),
                    ))
                  ])),
            GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    setState(() => detailMode = !detailMode);
                    print(
                        'Muestra el boton de pause y la barra de nav de video');
                  });
                },
                onTap: () {
                  setState(() => fullMode = !fullMode);
                },
                child: Stack(children: [
                  Scaffold(),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset('assets/images/edificioplantas.jpg',
                        fit: BoxFit.fitWidth),
                  ),
                  SafeArea(
                      child: Material(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SimpleTopRow(),
                        Expanded(child: SimpleMiddleRow()),
                        ThirdStarRow(),
                        SecondStarRow(),
                        SimpleBottomRow(),
                      ],
                    ),
                  ))
                ])),
            ChatPage()
          ]), //_________________Segunda pagina____________________
          SafeArea(
              child: Scaffold(
            body: Column(
              children: [
                SimpleTopRow(),
                Expanded(child: SimpleMiddleRow()),
                SimpleBottomRow(),
              ],
            ),
          ))
        ]);
  }

  Widget _crearSlider() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Slider(
        activeColor: Theme.of(context).accentColor,
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

//_______________________TopRow_____________________________
// El título y los botones de compartir y descargar

class TopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 10.0),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child:
                      TitleText() //Text('Titancito es muy muy msuab g g Westi')
                  )),
          SizedBox(width: 26.0), // Para separación del botón con el título
          Container(
              alignment: Alignment.centerRight,
              child: GeneralButton(
                action: compartir,
                icon: FaIcon(FontAwesomeIcons.share),
                iconSize: 34,
              )),
          Container(
              alignment: Alignment.centerRight,
              child: GeneralButton(
                action: compartir,
                icon: FaIcon(FontAwesomeIcons.download),
                iconSize: 34,
              )),
        ],
      ),
    );
  }
}

//_____Funciones de los GeneralButtons del TopRow_____________________________
void descargar() {
  print('Soy el botón de descarga');
}

void compartir() {
  print('Soy el botón de compartir, funciono con Dynamic links');
}

//______________________MiddleRow_____________________________
// Botones de navegación entre Posts y Pausa.

class MiddleRow extends StatelessWidget {
  const MiddleRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 10.0),
      child: Row(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: GeneralButton(
                action: compartir,
                icon: FaIcon(FontAwesomeIcons.arrowLeft),
                iconSize: 32,
              )),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: GeneralButton(
                  action: compartir,
                  icon: FaIcon(
                    FontAwesomeIcons.pauseCircle,
                  ),
                  iconSize: 40,
                )),
          ),
          Container(
              alignment: Alignment.centerRight,
              child: GeneralButton(
                action: descargar,
                icon: FaIcon(FontAwesomeIcons.chevronRight),
                iconSize: 32,
              ))
        ],
      ),
    );
  }
}

//_______________________ThirdStarRow_____________________________
// Con la tercera estrella a la derecha

class ThirdStarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(left: 15.0, right: 12.5),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: GeneralButton(
                  action: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.star,
                  ),
                  iconSize: 32,
                )),
          )
        ],
      ),
    );
  }
}

//______________________ReportRow____________________________________
// Tiene el botón de report y la segunda estrella a misma altura

class ReportRow extends StatelessWidget {
  const ReportRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(left: 15.0, right: 12.5),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: GeneralButton(
                  action: descargar,
                  icon: FaIcon(
                    FontAwesomeIcons.shieldAlt,
                    color: Theme.of(context).errorColor,
                  ),
                  iconSize: 34,
                )),
          ),
          Container(
              alignment: Alignment.centerRight,
              child: GeneralButton(
                action: descargar,
                icon: FaIcon(
                  FontAwesomeIcons.star,
                ),
                iconSize: 34,
              )),
        ],
      ),
    );
  }
}
//______________________BottomRow_____________________________
// Boton logo, el de ir abajo (navegación a chat) y corazón.

class BottomRow extends StatelessWidget {
  const BottomRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 5.0, left: 15.0, right: 12.5),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: GeneralButton(
                  action: compartir,
                  icon: FaIcon(
                    FontAwesomeIcons.chess,
                    color: Theme.of(context).accentColor,
                  ),
                  iconSize: 34,
                )),
          ),
          Container(
              alignment: Alignment.center,
              child: GeneralButton(
                action: descargar,
                icon: FaIcon(
                  FontAwesomeIcons.angleDoubleDown,
                ),
                iconSize: 34,
              )),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: GeneralButton(
                  action: descargar,
                  icon: FaIcon(
                    FontAwesomeIcons.star,
                  ),
                  iconSize: 36,
                )),
          )
        ],
      ),
    );
  }
}

//_______________________SimpleTopRow_____________________________
// Solo título.

class SimpleTopRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 10.0),
      child: Container(alignment: Alignment.centerLeft, child: TitleText()),
    );
  }
}

//_______________________SimpleMiddleRow_____________________________
// Vacía, pero sirve para dejar bien a las otras Rows.

class SimpleMiddleRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//_______________________OnlyPauseRow_____________________________
// Vacía, pero sirve para dejar bien a las otras Rows.

class OnlyPauseRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          child: GeneralButton(
            action: compartir,
            icon: FaIcon(
              FontAwesomeIcons.pauseCircle,
            ),
            iconSize: 50,
          )),
    );
  }
}

//_______________________SecondStarRow_____________________________
// La segunda estrella a la derecha, como ThirdStarRow

class SecondStarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(left: 15.0, right: 12.5),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: GeneralButton(
                  action: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.star,
                  ),
                  iconSize: 34,
                )),
          )
        ],
      ),
    );
  }
}
//______________________SimpleBottomRow_____________________________
// Botón de logo y corazón.

class SimpleBottomRow extends StatelessWidget {
  const SimpleBottomRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 5.0, left: 15.0, right: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                child: GeneralButton(
                  action: compartir,
                  icon: FaIcon(
                    FontAwesomeIcons.chess,
                    color: Theme.of(context).accentColor,
                  ),
                  iconSize: 34,
                )),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: GeneralButton(
                  action: descargar,
                  icon: FaIcon(
                    FontAwesomeIcons.star,
                  ),
                  iconSize: 34,
                )),
          )
        ],
      ),
    );
  }
}
