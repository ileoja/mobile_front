import 'package:flutter/material.dart';
import 'package:ileoja/Screen/Profile/Followers/followingIndex.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';


class FollowersTab extends StatefulWidget {
  _FollowersTabState createState() => _FollowersTabState();
}

class _FollowersTabState extends State<FollowersTab>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: PsColors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: PsColors.white,
              title: Text('Followers',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
              automaticallyImplyLeading: true,
              iconTheme:IconThemeData(
                color: Colors.black, //change your color here
              ),
              bottom: TabBar(
                indicatorColor: PsColors.mainColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0.6,
                labelPadding: EdgeInsets.symmetric( horizontal: 25),
                unselectedLabelColor: PsColors.grey,
                labelStyle:TextStyle(fontWeight: FontWeight.normal, fontSize: 17, color: PsColors.black, fontFamily: 'Montserrat'),
                unselectedLabelStyle:TextStyle(fontWeight: FontWeight.normal, fontSize: 17, color: PsColors.black, fontFamily: 'Montserrat'),
                labelColor: PsColors.mainColor,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'Followers',
                  ),
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'Request',
                  ),
                  // Tab(text: 'Menu'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                FollowersIndexScreen(data: 'followers',),
                FollowersIndexScreen(data: 'following',),
                FollowersIndexScreen(data: 'awaiting',),
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

