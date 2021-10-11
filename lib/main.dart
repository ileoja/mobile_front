import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/ps_provider_dependencies.dart';
import 'package:ileoja/Screen/SplashScreenIndex.dart';
import 'package:ileoja/acadaar_ctrl/Db/common/EmmadedayoDB.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_theme_data.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_theme_provider.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_theme_repository.dart';
import 'package:ileoja/acadaar_ctrl/config/router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'acadaar_ctrl/DynamicTheme.dart';


Future<void> main() async {
  // add this, and it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();
  //GoogleMap.init('API_KEY');
//  final FirebaseMessaging _fcm = FirebaseMessaging();
//  if (Platform.isIOS) {
//    _fcm.requestNotificationPermissions(const IosNotificationSettings());
//  }

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getString('codeC') == 'null') {
    await prefs.setString('codeC', 'null');
    await prefs.setString('codeL', 'null');
  }


  SharedPreferences.getInstance().then((prefs) {
    runApp(PSApp(prefs: prefs));
  });
}

class PSApp extends StatefulWidget {
  final SharedPreferences prefs;
  //
  PSApp({this.prefs});

  @override
  _PSAppState createState() => _PSAppState();
}

class _PSAppState extends State<PSApp> {
  Completer<ThemeData> themeDataCompleter;
  EmmaSharedPreferences psSharedPreferences;
  SharedPreferences prefs;

  getValue() async {
    await initialize();
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    getValue();
    super.initState();
  }

  Future<ThemeData> getSharePerference() {
    Utils.psPrint('>> get share perference');
    if (themeDataCompleter == null) {
      Utils.psPrint('init completer');
      themeDataCompleter = Completer<ThemeData>();
    }

    if (psSharedPreferences == null) {
      Utils.psPrint('init ps shareperferences');
      psSharedPreferences = EmmaSharedPreferences.instance;
      Utils.psPrint('get shared');
      psSharedPreferences.futureShared.then((SharedPreferences sh) {
        psSharedPreferences.shared = sh;
        Utils.psPrint('init theme provider');
        final PsThemeProvider psThemeProvider = PsThemeProvider(
            repo: PsThemeRepository(psSharedPreferences: psSharedPreferences));
        Utils.psPrint('get theme');
        final ThemeData themeData = psThemeProvider.getTheme();
        themeDataCompleter.complete(themeData);
        Utils.psPrint('themedata loading completed');
      });
    }

    return themeDataCompleter.future;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
      Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Color(0xFFFD6649),
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    PsColors.loadColor(context);

    return MultiProvider(
        providers: <SingleChildWidget>[
          ...providers,

        ],
        child: DynamicTheme(
            defaultBrightness: Brightness.light,
            data: (Brightness brightness) {
              if (brightness == Brightness.light) {
                return themeData(ThemeData.light());
              } else {
                return themeData(ThemeData.dark());
              }
            },
            themedWidgetBuilder: (BuildContext context, ThemeData theme) {
              return PlatformProvider(
                  settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
                  builder: (context) => PlatformApp(
                      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                        DefaultMaterialLocalizations.delegate,
                        DefaultWidgetsLocalizations.delegate,
                        DefaultCupertinoLocalizations.delegate,
                      ],
                      home: _handleCurrentScreen(),
                      onGenerateRoute: RouteGenerator.generateRoute,
                      material: (_, __)  => MaterialAppData(
                        title: "Ileoja",
                        theme: theme,
                        debugShowCheckedModeBanner: false,
                      ),
                      cupertino: (_, __) => CupertinoAppData(
                        title: "Ileoja",
                        theme: new CupertinoThemeData(
                          brightness: Brightness.light,
                          primaryColor: PsColors.mainColor,
                          barBackgroundColor: PsColors.white,
                          scaffoldBackgroundColor: PsColors.white,
                          textTheme: CupertinoTextThemeData(
                            textStyle: TextStyle(
                                color: PsColors.textPrimaryColor,
                                fontFamily: DrConfig.dr_default_font_family),
                            actionTextStyle: TextStyle(
                                color: PsColors.textPrimaryColor,
                                fontFamily: DrConfig.dr_default_font_family),
                            tabLabelTextStyle: TextStyle(
                                color: PsColors.textPrimaryColor,
                                fontFamily: DrConfig.dr_default_font_family),
                            navTitleTextStyle: TextStyle(
                              color: PsColors.textPrimaryColor,
                              fontFamily: DrConfig.dr_default_font_family,
                            ),
                            navLargeTitleTextStyle: TextStyle(
                                color: PsColors.textPrimaryColor,
                                fontFamily: DrConfig.dr_default_font_family,
                                fontWeight: FontWeight.bold),
                            navActionTextStyle: TextStyle(
                                color: PsColors.textPrimaryColor,
                                fontFamily: DrConfig.dr_default_font_family),
                            pickerTextStyle: TextStyle(
                                color: PsColors.textPrimaryColor,
                                fontFamily: DrConfig.dr_default_font_family,
                                fontWeight: FontWeight.bold),
                            dateTimePickerTextStyle: TextStyle(
                                color: PsColors.textPrimaryColor,
                                fontFamily: DrConfig.dr_default_font_family,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        debugShowCheckedModeBanner: false,
                      )
                  )
              );
            })
    );
  }

  Widget _handleCurrentScreen() {
    bool seen = (widget.prefs.getBool('seen') ?? false);
    if (seen) {
      return new ScreenFlash();
    } else {
      return new ScreenFlash();
    }
  }
}
