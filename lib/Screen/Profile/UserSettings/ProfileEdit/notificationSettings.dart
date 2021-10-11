
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/NotificationModel.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Provider/notification/notification_provider.dart';
import 'package:ileoja/Reprository/notification_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:ileoja/acadaar_ctrl/validations.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final UserModel data;
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phone = new TextEditingController();
  Validations validations = new Validations();
  bool passwordVisible;
  bool remember = false;
  DrValueHolder psValueHolder;
  UserRepository userRepo;
  //UserProvider userProvider;
  NotificationProvider notificationProvider;
  NotificationRepository notificationRepository;
  bool bindDataFirstTime = true;
  bool pshHotDealsRecommendation,pshIncomingMessage,pshImportantInformation,pshPremiumPackage,pshJobAlert,pshViewedAds,smsNotification,
  emailHotsDeal,emailInfoAboutAds,emailPremiumPackage,emailSubscription,emailMessages,emailFeedback= false;


  @override
  void initState() {
    passwordVisible = true;
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> phoneFormat(String phone) async {
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(phone);
    String parsableNumber = number.parseNumber();
    _phone.text = parsableNumber;
  }

  bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }

  @override
  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);
    notificationRepository = Provider.of<NotificationRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Notification Settings', style: TextStyle(color: PsColors.black, fontSize: 18, fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
        material: (_, __) => MaterialAppBarData(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          //automaticallyImplyLeading: true,
        ),
        automaticallyImplyLeading: true,
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: SingleChildScrollView(
          child: ChangeNotifierProvider<NotificationProvider>(
            lazy: false,
            create: (BuildContext context) {
              final NotificationProvider provider = NotificationProvider(repo: notificationRepository, psValueHolder: psValueHolder);
              provider.getData(psValueHolder.apiToken,Utils.checkUserLoginId(provider.psValueHolder));
              notificationProvider = provider;
              return notificationProvider;
            },
              // bool ,,,,
              // ,,,,,= false;

              child: Consumer<NotificationProvider>(
                builder: (BuildContext context, NotificationProvider provider, Widget child)  {
                  if (notificationProvider != null &&
                      notificationProvider.user != null &&
                      notificationProvider.user.data != null) {
                    if (bindDataFirstTime)  {
                      if(notificationProvider.user.data.pshHotDealsRecommendation == 'true'){
                        pshHotDealsRecommendation = true;
                      }else{
                        pshHotDealsRecommendation = false;
                      }
                      if(notificationProvider.user.data.pshIncomingMessage == 'true'){
                        pshIncomingMessage = true;
                      }else{
                        pshIncomingMessage = false;
                      }
                      if(notificationProvider.user.data.pshImportantInformation == 'true'){
                        pshImportantInformation = true;
                      }else{
                        pshImportantInformation = false;
                      }
                      if(notificationProvider.user.data.pshPremiumPackage == 'true'){
                        pshPremiumPackage = true;
                      }else{
                        pshPremiumPackage = false;
                      }
                      if(notificationProvider.user.data.pshJobAlert == 'true'){
                        pshJobAlert = true;
                      }else{
                        pshJobAlert = false;
                      }
                      if(notificationProvider.user.data.pshViewedAds == 'true'){
                        pshViewedAds = true;
                      }else{
                        pshViewedAds = false;
                      }
                      if(notificationProvider.user.data.smsNotification == 'true'){
                        smsNotification = true;
                      }else{
                        smsNotification = false;
                      }
                      if(notificationProvider.user.data.emailHotsDeal == 'true'){
                        emailHotsDeal = true;
                      }else{
                        emailHotsDeal = false;
                      }
                      if(notificationProvider.user.data.emailInfoAboutAds == 'true'){
                        emailInfoAboutAds = true;
                      }else{
                        emailInfoAboutAds = false;
                      }
                      if(notificationProvider.user.data.emailPremiumPackage == 'true'){
                        emailPremiumPackage = true;
                      }else{
                        emailPremiumPackage = false;
                      }
                      if(notificationProvider.user.data.emailSubscription == 'true'){
                        emailSubscription = true;
                      }else{
                        emailSubscription = false;
                      }
                      if(notificationProvider.user.data.emailMessages == 'true'){
                        emailMessages = true;
                      }else{
                        emailMessages = false;
                      }
                      if(notificationProvider.user.data.emailFeedback == 'true'){
                        emailFeedback = true;
                      }else{
                        emailFeedback = false;
                      }
                      bindDataFirstTime = false;
                    }
                    return SingleChildScrollView(
                        child: Container(
                            margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 11),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/image/login_view.png'))),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                                        Container(
                                          margin: EdgeInsets.only(top: 5,right: 14, left: 14),
                                          alignment: Alignment.topLeft,
                                          child: Text('Push Notification',style: TextStyle(fontFamily: 'Montserrat', fontSize: 20, color: PsColors.black, fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Hot deals and recommendations',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    pshHotDealsRecommendation = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "psh_hot_deals_recommendation": pshHotDealsRecommendation.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: pshHotDealsRecommendation,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Incoming messages from other users',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    pshIncomingMessage = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "psh_incoming_message": pshIncomingMessage.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: pshIncomingMessage,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Important information about your Ads, call to action',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    pshImportantInformation = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "psh_important_information": pshImportantInformation.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: pshImportantInformation,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Package activation/expiration',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    pshPremiumPackage = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "psh_premium_package": pshPremiumPackage.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: pshPremiumPackage,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Job Alerts',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    pshJobAlert = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "psh_job_alert": pshJobAlert.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: pshJobAlert,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Viewed Ads',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    pshViewedAds = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "psh_viewed_ads": pshViewedAds.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      ////Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: pshViewedAds,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),


                                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                                        Container(
                                          margin: EdgeInsets.only(top: 5,right: 14, left: 14),
                                          alignment: Alignment.topLeft,
                                          child: Text('Email Notification',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: PsColors.black, fontFamily: 'Montserrat')),
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Hot deals and recommendations',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    emailHotsDeal = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "email_hots_deal": emailHotsDeal.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: emailHotsDeal,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Info about your Ads',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    emailInfoAboutAds = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "email_info_about_ads": emailInfoAboutAds.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: emailInfoAboutAds,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Premium packages',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    emailPremiumPackage = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "email_premium_package": emailPremiumPackage.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: emailPremiumPackage,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Your subscription',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    emailSubscription = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "email_subscription": emailSubscription.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: emailSubscription,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('Message',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    emailMessages = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "email_messages": emailMessages.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: emailMessages,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('FeedBack',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    emailFeedback = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "email_feedback": emailFeedback.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: emailFeedback,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),


                                        SizedBox(height: SizeConfig.screenHeight * 0.02),
                                        Container(
                                          margin: EdgeInsets.only(top: 5,right: 14, left: 14),
                                          alignment: Alignment.topLeft,
                                          child: Text('SMS Notification',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: PsColors.black, fontFamily: 'Montserrat')),
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                              child: Text('SMS info notification',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                            ),
                                            PlatformSwitch(
                                                onChanged: (bool value) async {
                                                  setState(() {
                                                    smsNotification = value;
                                                  });
                                                  if (await Utils.checkInternetConnectivity()) {
                                                    //await PsProgressDialog.showDialog(context);
                                                    final DrResource<NotificationModel> _apiStatus = await notificationProvider.postNotification(
                                                      {
                                                        "sms_notification": smsNotification.toString(),
                                                        "id":notificationProvider.user.data.id
                                                      },
                                                      psValueHolder.apiToken,
                                                    );
                                                    if (_apiStatus.data != null) {
                                                      //PsProgressDialog.dismissDialog();
                                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                                      //Navigator.pop(context);

                                                    } else {
                                                      context.showErrorBar(content: Text(_apiStatus.message));
                                                      //PsProgressDialog.dismissDialog();
                                                    }
                                                  } else {
                                                    context.showErrorBar(content: Text("Bad internet connection"));
                                                    //PsProgressDialog.dismissDialog();
                                                  }
                                                },
                                                value: smsNotification,
                                                material: (_, __)  => MaterialSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                  inactiveThumbColor: PsColors.grey,
                                                ),
                                                cupertino: (_, __) => CupertinoSwitchData(
                                                  activeColor: PsColors.mainColor,
                                                )
                                            )
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                )
                            )
                        )
                    );
                  }else{
                    return PSProgressIndicator(notificationProvider.user.status,context);
                  }
                }),
          )),
    );
  }
}
