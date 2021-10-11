import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';

class OrderSuccess extends StatefulWidget{
  @override
  OrderSuccessState createState() => OrderSuccessState();
}

class OrderSuccessState extends State <OrderSuccess>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(
      backgroundColor: Colors.white,
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(120),
                    child: Center(
                      child: Image.asset('assets/image/tick.png', height: 62,),
                    ),
                    decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight,
                        colors: [Colors.pink, PsColors.mainColor]), borderRadius: BorderRadius.circular(25)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text('Your order request has been sent successfully',
                              textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Montserrat'))),
                    ],
                  ),
                ],
              ),
            ),
          ]

      ),
    );
  }
}