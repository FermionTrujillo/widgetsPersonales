import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetspersonales/providers/provider.dart';
import 'package:widgetspersonales/widgets/principal_buttons.dart';

//--------------CApbar----------------
class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(left: 15.0),
              alignment: Alignment.centerLeft,
              child: GeneralButton(
                action: () {
                  print('hey qu tal');
                },
                icon: FaIcon(FontAwesomeIcons.comments),
                iconSize: 34,
              )),
          SizedBox(width: 20.0),
          SearchTextField(),
          SizedBox(width: 20.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              alignment: Alignment.centerRight,
              child: GeneralButton(
                action: () {
                  print('hey qu tal');
                },
                icon: FaIcon(FontAwesomeIcons.smile),
                iconSize: 34,
              )),
        ],
      ),
    );
  }
}

class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<SearchTextFieldProvider>(context);
    if (myProvider.textFieldOn) {
      return Expanded(
          child: TextField(
        autofocus: true,
        onTap: () {
          if (myProvider.textFieldOn) {
            setState(() {});
            print(myProvider.textFieldOn);
          } else {
            setState(() {
              myProvider.textFieldOn = !myProvider.textFieldOn;
              print(myProvider.textFieldOn);
            });
          }
        },
        decoration: InputDecoration(border: OutlineInputBorder()),
      ));
    }
    return Expanded(
        child: TextField(
      autofocus: false,
      onTap: () {
        if (myProvider.textFieldOn) {
          print(myProvider.textFieldOn);
        } else {
          setState(() {
            myProvider.textFieldOn = !myProvider.textFieldOn;
            print(myProvider.textFieldOn);
          });
        }
      },
      decoration: InputDecoration(border: OutlineInputBorder()),
    ));
  }
}
