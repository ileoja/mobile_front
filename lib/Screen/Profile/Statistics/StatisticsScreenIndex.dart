import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/StatisticsModel.dart';
import 'package:ileoja/Provider/statistics/statistics_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/statistics_repository.dart';
import 'package:ileoja/Reprository/statistics_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class StatisticsScreenIndex extends StatefulWidget {
  const StatisticsScreenIndex({
    Key key,
  }) : super(key: key);

  @override
  _ReferralIndexScreenState createState() => _ReferralIndexScreenState();
}

class _ReferralIndexScreenState extends State<StatisticsScreenIndex> {
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  StatisticsProvider statisticsProvider;
  StatisticsRepository statisticsRepository;
  List<StatisticsModel> chartData = [];

  final List<_ChartData> chartDatas = <_ChartData>[
    _ChartData(2005, 21, 28),
    _ChartData(2006, 24, 44),
    _ChartData(2007, 36, 48),
    _ChartData(2008, 38, 50),
    _ChartData(2009, 54, 66),
    _ChartData(2010, 57, 78),
    _ChartData(2011, 70, 84)
  ];

  @override
  void initState() {
    super.initState();
  }




  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    statisticsRepository = Provider.of<StatisticsRepository>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: Text('Statistics', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
        material: (_, __)  => MaterialAppBarData(
          centerTitle: false,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(),
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 5, right: 5, left: 5),
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/login_view.png'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Row(
                    children: <Widget>[
                      Text("Impressions",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                          color: PsColors.mainColor, fontFamily: 'Montserrat'),),
                      Spacer(),
                      Text('0', style: TextStyle(color: PsColors.mainColor),),
                      Container(width: 10)
                    ],
                  ),
                  decoration: BoxDecoration(border: Border.all(color: PsColors.mainColor),  borderRadius: BorderRadius.circular(8),),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Row(
                    children: <Widget>[
                      Text("Visitors", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                          color: PsColors.mainColor, fontFamily: 'Montserrat'),),
                      Spacer(),
                      Text('0', style: TextStyle(color: PsColors.mainColor),),
                      Container(width: 10)
                    ],
                  ),
                  decoration: BoxDecoration(border: Border.all(color: PsColors.mainColor), borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Row(
                    children: <Widget>[
                      Text("Phone View",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                          color: PsColors.mainColor, fontFamily: 'Montserrat'),),
                      Spacer(),
                      Text('0', style: TextStyle(color: PsColors.mainColor),),
                      Container(width: 10)
                    ],
                  ),
                  decoration: BoxDecoration(border: Border.all(color: PsColors.mainColor), borderRadius: BorderRadius.circular(8)),
                ),
              ),
              Divider(height: 5),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Row(
                    children: <Widget>[
                      Text("Chat Request",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                          color: PsColors.mainColor, fontFamily: 'Montserrat'),),
                      Spacer(),
                      Text('0', style: TextStyle(color: PsColors.mainColor),),
                      Container(width: 10)
                    ],
                  ),
                  decoration: BoxDecoration(border: Border.all(color: PsColors.mainColor), borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);
  final double x;
  final double y;
  final double y2;
}