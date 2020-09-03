import 'package:flutter/material.dart';
import 'package:widgetspersonales/widgets/principal_buttons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(left: 25.0),
              alignment: Alignment.centerLeft,
              child: GeneralButton(
                action: () {
                  print('hey qu tal');
                },
                icon: FaIcon(FontAwesomeIcons.star),
                iconSize: 34,
              )),
          SizedBox(width: 20.0),
          Expanded(child: TextField()),
          SizedBox(width: 20.0),
          Container(
              padding: EdgeInsets.only(right: 25.0),
              alignment: Alignment.centerRight,
              child: GeneralButton(
                action: () {
                  print('hey qu tal');
                },
                icon: FaIcon(FontAwesomeIcons.star),
                iconSize: 34,
              )),
        ],
      ),
    );
  }
}
