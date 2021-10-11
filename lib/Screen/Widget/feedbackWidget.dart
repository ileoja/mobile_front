import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Screen/Profile/FeedBack/FeedBackDataIndex.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class FeedBackTab extends StatefulWidget{
  const FeedBackTab({Key key}) : super(key: key);

  @override
  FeedBackTabState createState() => FeedBackTabState();
}

class FeedBackTabState extends State <FeedBackTab> with SingleTickerProviderStateMixin{
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
            elevation: 0.0,
            title:Text('FeedBack',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
            automaticallyImplyLeading: true,
            iconTheme:IconThemeData(
              color: Colors.black, //change your color here
            ),
            bottom:  TabBar(
                indicatorColor: PsColors.mainColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0.6,
                labelPadding: EdgeInsets.symmetric( horizontal: 55),
                unselectedLabelColor: PsColors.grey,
                labelStyle:TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: PsColors.black, fontFamily: 'Montserrat'),
                unselectedLabelStyle:TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: PsColors.black, fontFamily: 'Montserrat'),
                labelColor: PsColors.mainColor,
                isScrollable: true,
                tabs:[
                  Tab(
                    text: 'RECEIVED',
                  ),
                  Tab(
                    text: 'SENT',
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
            FeedBackDataIndex(data: 'received',),
            FeedBackDataIndex(data: 'sent',),
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