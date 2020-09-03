import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgetspersonales/widgets/principal_buttons.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Theme.of(context).errorColor,
              ),
              Expanded(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Theme.of(context).accentColor,
                ),
              ),
              AFirstStarRow(),
              ASecondStarRow(),
              BottomRow(),
            ],
          )),
    );
  }
}

class AFirstStarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 12.0, left: 15.0, right: 15.0),
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

class ASecondStarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 12.0, left: 15.0, right: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: FaIcon(
                FontAwesomeIcons.shieldAlt,
                size: 36.0,
                color: Theme.of(context).errorColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: FaIcon(
                FontAwesomeIcons.star,
                size: 34.5,
              ),
            ),
          )
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
        padding: EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
        child: Row(children: [
          Expanded(
            child: Container(
                alignment: Alignment.bottomLeft,
                child: GeneralButton(
                  action: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.chess,
                    color: Theme.of(context).accentColor,
                  ),
                  iconSize: 34,
                )),
          ),
          Container(
              alignment: Alignment.bottomCenter,
              child: GeneralButton(
                action: () {},
                icon: FaIcon(
                  FontAwesomeIcons.angleDoubleDown,
                ),
                iconSize: 34,
              )),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: FaIcon(
              FontAwesomeIcons.star,
              size: 36.0,
            ),
          )),
        ]));
  }
}
