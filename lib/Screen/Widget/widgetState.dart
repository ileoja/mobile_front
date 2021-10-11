import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ileoja/Model/LocalGovModel.dart';
import 'package:ileoja/Model/StateModel.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class StateWidget extends StatelessWidget {
  const StateWidget({
    Key key,
    @required this.data,
    this.onTap,
  }) : super(key: key);

  final StateModel data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: PsColors.white,
          border: Border.all(color: PsColors.white,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.size8)),

        ),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 20,
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data.name,
                    style: setStyleContent(context,PsColors.black,14,FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

class LgaWidget extends StatelessWidget {
  const LgaWidget({
    Key key,
    @required this.data,
    this.onTap,
  }) : super(key: key);

  final LGAModel data;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: PsColors.white,
          border: Border.all(color: PsColors.white,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.size8)),

        ),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Row(
          children: <Widget>[
            Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data.name,
                    style: setStyleContent(context,PsColors.black,14,FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
