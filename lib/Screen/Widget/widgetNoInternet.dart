import 'package:flutter/material.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';


class WidgetNoInternet extends StatelessWidget {

  Widget build(BuildContext context) {
    return new  Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(DrConfig.getImage('bg_no_item_cactus.png'), width: double.infinity),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            width: 380,
            child: Text("There is no account available \nTap button below to add new account", textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }

}

