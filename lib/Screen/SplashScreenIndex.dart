import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ileoja/Provider/app_info/app_info_provider.dart';
import 'package:ileoja/Provider/clear_all/clear_all_data_provider.dart';
import 'package:ileoja/Reprository/app_info_repository.dart';
import 'package:ileoja/Reprository/clear_all_data_repository.dart';
import 'package:ileoja/Screen/Widget/errorWidget.dart';
import 'package:ileoja/acadaar_ctrl/Holder/App_info.dart';
import 'package:ileoja/acadaar_ctrl/Holder/appInfoHolder.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_status.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/constant/route_paths.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:show_up_animation/show_up_animation.dart';

class ScreenFlash extends StatefulWidget {
  static const String id = 'screenflash';
  @override
  _ScreenFlashState createState() => new _ScreenFlashState();
}

class _ScreenFlashState extends State<ScreenFlash>
    with TickerProviderStateMixin {
  AnimationController controller;

  Animation animation;

  double beginAnim = 0.0;
  double endAnim = 1.0;
  bool _loading;
  double _progressValue;

  @override
  void initState() {
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
    // Navigator.push(context, new MaterialPageRoute(
    //     builder: (context) => WalkThroughScreen()));
  }

  Future<dynamic> callDateFunction(AppInfoProvider provider,
      ClearAllDataProvider clearAllDataProvider, BuildContext context) async {
    String realStartDate = '0';
    String realEndDate = '0';
    if (await Utils.checkInternetConnectivity()) {
      realEndDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
      final AppInfoParameterHolder appInfoParameterHolder =
      AppInfoParameterHolder(userId: '1');

      final DrResource<DrAppInfo> _psAppInfo =
      await provider.loadDeleteHistory(appInfoParameterHolder.toMap());

      if (_psAppInfo.status == DrStatus.SUCCESS) {
        //provider.replaceDate(realStartDate, realEndDate);

        if (_psAppInfo.data.userStatus == '0') {
          if (Platform.isAndroid) {
            showErrorAndroid(context,
                "Your account has been blocked, kindly contact the support to resolve your issues");
          } else if (Platform.isIOS) {
            showErrorIos(context,
                "Your account has been blocked, kindly contact the support to resolve your issues");
          }
        } else if (_psAppInfo.data.userStatus == "2") {
          if (Platform.isAndroid) {
            showErrorAndroid(context, "Your account is yet to be activated");
          } else if (Platform.isIOS) {
            showErrorIos(context, "Your account is yet to be activated");
          }
        } else if (_psAppInfo.data.appVersion != DrConfig.app_version) {
          if (Platform.isAndroid) {
            showVersionAndroid(context,
                "You are running an older version of WasteBazaar app, please update your app to ${_psAppInfo.data.appVersion} or newer");
          } else if (Platform.isIOS) {
            showVersionIos(context,
                "You are running an older version of WasteBazaar app, please update your app to ${_psAppInfo.data.appVersion} or newer");
          }
        } else if (_psAppInfo.data.loginAgain == "false") {
          Navigator.pushReplacementNamed(
            context,
            RoutePaths.home,
          );
        } else if (_psAppInfo.data.loginAgain == "true") {
          Navigator.pushReplacementNamed(
            context,
            RoutePaths.home,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            RoutePaths.home,
          );
        }
      } else if (_psAppInfo.status == DrStatus.ERROR) {
        Navigator.pushReplacementNamed(
          context,
          RoutePaths.home,
        );
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        RoutePaths.home,
      );
    }
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppInfoRepository repo1;
    AppInfoProvider provider;
    ClearAllDataRepository clearAllDataRepository;
    ClearAllDataProvider clearAllDataProvider;
    DrValueHolder valueHolder;
    PsColors.loadColor(context);
    valueHolder = Provider.of<DrValueHolder>(context);
    repo1 = Provider.of<AppInfoRepository>(context);
    clearAllDataRepository = Provider.of<ClearAllDataRepository>(context);
    var size = MediaQuery.of(context).size.width;
    var sizeheight = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ClearAllDataProvider>(
            lazy: false,
            create: (BuildContext context) {
              clearAllDataProvider = ClearAllDataProvider(
                  repo: clearAllDataRepository, psValueHolder: valueHolder);

              return clearAllDataProvider;
            }),
        ChangeNotifierProvider<AppInfoProvider>(
            lazy: false,
            create: (BuildContext context) {
              provider =
                  AppInfoProvider(repo: repo1, psValueHolder: valueHolder);
              callDateFunction(provider, clearAllDataProvider, context);
              return provider;
            }),
      ],
      child: Consumer<AppInfoProvider>(
        builder: (BuildContext context, AppInfoProvider clearAllDataProvider,
            Widget child) {
          return Consumer<AppInfoProvider>(builder: (BuildContext context,
              AppInfoProvider clearAllDataProvider, Widget child) {
            return Scaffold(
              body: SingleChildScrollView(
                 child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/screen_bg.png'))),
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: new Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 150.0),
                          child: Center(
                              child: Image.asset(
                                'assets/image/logomain.png',
                                width: 250,
                              )),
                        ),
                        SizedBox(
                          height: sizeheight - 350,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                          padding: EdgeInsets.symmetric(horizontal: 90),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ShowUpAnimation(
                                child: Text(
                                    'Post free ad',
                                    key: Key("Post free ad"),
                                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, color: PsColors.mainColor, fontWeight: FontWeight.w700)
                                ),
                              ),
                              ShowUpAnimation(
                                delayStart: Duration(seconds: 1),
                                child: Text(
                                    'and sell fast',
                                    key: Key("and sell fast"),
                                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, color: PsColors.black, fontWeight: FontWeight.w700)
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 1,),
                        Container(
                          margin: EdgeInsets.only(right: 5, left: 5),
                          padding: EdgeInsets.symmetric(horizontal: 110),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ShowUpAnimation(
                                delayStart: Duration(seconds: 2),
                                child: Text(
                                    'But at',
                                    key: Key('But at',),
                                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, color: PsColors.black, fontWeight: FontWeight.w700)
                                ),
                              ),
                              ShowUpAnimation(
                                delayStart: Duration(seconds: 3),
                                child: Text(
                                    'best prices',
                                    key: Key('best prices',),
                                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, color: PsColors.mainColor, fontWeight: FontWeight.w700)
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: sizeheight - 300,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: size - 320, right: size - 320),
                            child: Center(
                              child: LoadingIndicator(indicatorType: Indicator.ballPulse, color: PsColors.mainColor,),
                            )),
                        Container(
                          // width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 30.0, right: 30.0),
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              DrConfig.app_name,
                              style: setStyleContent(context, PsColors.black, 20, FontWeight.normal),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
      // ),
    );
  }
}
