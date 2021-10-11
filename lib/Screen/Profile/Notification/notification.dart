import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NotificationsTab extends StatefulWidget{
  @override
  NotificationsTabState createState() => NotificationsTabState();
}

class NotificationsTabState extends State <NotificationsTab>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade300,
          child: Column(
            children: [

            ],
          ),
        )
      ),
    );
  }
}