import 'package:flutter/material.dart';
import 'package:ileoja/Screen/Profile/myAdvert/myAdvertIndex.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';


class MyAdvertTab extends StatefulWidget {
  _TabControllerState createState() => _TabControllerState();
}

class _TabControllerState extends State<MyAdvertTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: PsColors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: PsColors.white,
              title: Text('My Adverts', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18,
                  color: PsColors.black, fontFamily: 'Montserrat')),
              automaticallyImplyLeading: true,
              iconTheme:IconThemeData(
                color: Colors.black, //change your color here
              ),
              bottom: TabBar(
                //controller: _tabController,
                indicatorColor: PsColors.mainColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1.0,
                unselectedLabelColor: PsColors.grey,
                labelStyle:TextStyle(fontWeight: FontWeight.normal, fontSize: 17, color: PsColors.black, fontFamily: 'Montserrat'),
                unselectedLabelStyle:TextStyle(fontWeight: FontWeight.normal, fontSize: 17, color: PsColors.black, fontFamily: 'Montserrat'),
                labelColor: PsColors.mainColor,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'Active',
                  ),
                  Tab(
                    text: 'Reviewing',
                  ),
                  Tab(
                    text: 'Declined',
                  ),
                  Tab(
                    text: 'Closed',
                  ),

                  // Tab(text: 'Menu'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AdvertScreenIndex(data: 'active',),
                AdvertScreenIndex(data: 'reviewing',),
                AdvertScreenIndex(data: 'declined',),
                AdvertScreenIndex(data: 'closed',),
              ],
            ),
          )),
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
      length: 4,
      vsync: this,
    );
  }
}

