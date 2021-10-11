import 'package:flutter/material.dart';
import 'package:ileoja/Screen/LoginAuth/loginScreenIndex.dart';
import 'package:ileoja/Screen/LoginAuth/registerPage.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:nb_utils/nb_utils.dart';

class AuthBottom extends StatefulWidget {
  static const String id = 'AuthBottom';
  @override
  _AuthBottomState createState() => new _AuthBottomState();
}

class _AuthBottomState extends State<AuthBottom>
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
  

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    var sizeheight = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/screen_bg.png'))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/image/logomain.png', height: 80, fit: BoxFit.cover),
                ),
                8.height,
                Text('Lorem ipsum  ', style: boldTextStyle(size: 24, color: Colors.black)),
              ],
            ).paddingBottom(context.height() * 0.4),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              width: context.width(),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radiusOnly(topLeft: 16, topRight: 16),
                backgroundColor:Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome", style: boldTextStyle(size: 22)),
                  8.height,
                  Center(
                    child: Text("If you are already have  Grocery account, enter your email below", style: setStyleContent(context, PsColors.black, 15, FontWeight.normal)),
                  ),
                  16.height,
                  gsAppButton(context, "Continue with email", () {
                    finish(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  }),
                  16.height,
                  AppButton(
                    width: context.width(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(DrConfig.getImage('apple_icon.png'), height: 24, width: 24),
                        8.width,
                        Text("Sign in with Apple", style: boldTextStyle(color: Colors.white)),
                      ],
                    ),
                    color: Colors.black,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
                    onTap: () {},
                  ),
                  16.height,
                  AppButton(
                    color: Colors.white,
                    elevation: 0,
                    width: context.width(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(DrConfig.getImage('google_icon.png'), height: 24, width: 24),
                        8.width,
                        Text("Sign in with Google", style: boldTextStyle()),
                      ],
                    ),
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      side: BorderSide(color: Colors.grey[300]),
                    ),
                    onTap: () {},
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: secondaryTextStyle()),
                      3.width,
                      Text("Register", style: secondaryTextStyle(color: PsColors.mainColor)),
                    ],
                  ).onTap(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  // GSRegisterScreen().launch(context);
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget gsAppButton(BuildContext context, String title, Function onTap) {
    return AppButton(
      width: context.width(),
      child: Text(title, style: boldTextStyle(color: Colors.white)),
      color: PsColors.mainColor,
      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      onTap: onTap,
    );
  }
}
