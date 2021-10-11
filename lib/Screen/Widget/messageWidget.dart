import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Screen/Profile/Notification/notification.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class MessNotificationTab extends StatefulWidget{
  const MessNotificationTab({Key key}) : super(key: key);

  @override
  MessNotificationTabState createState() => MessNotificationTabState();
}

class MessNotificationTabState extends State <MessNotificationTab> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child:  PlatformScaffold(
        backgroundColor: PsColors.white,
        appBar: PlatformAppBar(
          material: (_, __)  => MaterialAppBarData(
            bottom:  TabBar(
                indicatorColor: PsColors.mainColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1.0,
                labelPadding: EdgeInsets.symmetric( horizontal: 30),
                unselectedLabelColor: PsColors.black,
                labelStyle: setStyleContent(context,PsColors.black,17,FontWeight.normal),
                unselectedLabelStyle: setStyleContent(context,PsColors.black,17,FontWeight.normal),
                labelColor: PsColors.mainColor,
                isScrollable: true,
                tabs:[
                  Tab(
                    text: 'MESSAGES',
                  ),
                  Tab(
                    text: 'NOTIFICATIONS',
                  ),
                ]
            ),
          ),
          cupertino:  (_, __) => CupertinoNavigationBarData(),
        ),
        iosContentBottomPadding: true,
        iosContentPadding: true,
        body: TabBarView(
          children: [
            NotificationsTab(),
            NotificationsTab(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 3,
      vsync: this,
    );
  }
}