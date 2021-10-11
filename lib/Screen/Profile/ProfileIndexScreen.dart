import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Profile/Accountofficer/account_officer.dart';
import 'package:ileoja/Screen/Profile/Followers/followersTab.dart';
import 'package:ileoja/Screen/Profile/MyBalance/MybalanceIndex.dart';
import 'package:ileoja/Screen/Profile/Packages/packageIndexScreen.dart';
import 'package:ileoja/Screen/Profile/Share/shareIndexScreen.dart';
import 'package:ileoja/Screen/Profile/SpecialFB/specialFBads.dart';
import 'package:ileoja/Screen/Profile/Statistics/StatisticsScreenIndex.dart';
import 'package:ileoja/Screen/Profile/TopADs/topAds.dart';
import 'package:ileoja/Screen/Profile/UserSettings/Faq/FaqEdit.dart';
import 'package:ileoja/Screen/Profile/UserSettings/UserSettingsIndex.dart';
import 'package:ileoja/Screen/Profile/myAdvert/myAdvertIndexTab.dart';
import 'package:ileoja/Screen/Widget/feedbackWidget.dart';
import 'package:ileoja/Screen/Widget/widgetMenu.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

import 'Referral/referralIndexScrren.dart';

class ProfileIndexScreen extends StatefulWidget {
  const ProfileIndexScreen({
    Key key,
    this.action,
  }) : super(key: key);
  final bool action;
  @override
  _ProfileIndexScreenState createState() => _ProfileIndexScreenState();
}

class _ProfileIndexScreenState extends State<ProfileIndexScreen> {
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;

  @override
  void initState() {
    loadBack();
    super.initState();
  }

  Future<void> loadBack() async {
    if(widget.action){
      await userProvider.myProfile(psValueHolder.id,psValueHolder.apiToken);
      setState(() {});
    }else{
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: SingleChildScrollView(
          child: ChangeNotifierProvider<UserProvider>(
            lazy: false,
            create: (BuildContext context) {
              final UserProvider provider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
              provider.myProfile(Utils.checkUserLoginId(provider.psValueHolder),psValueHolder.apiToken);
              userProvider = provider;
              return userProvider;
            },
            child: Consumer<UserProvider>(
                builder: (BuildContext context, UserProvider provider, Widget child) {
                  if (userProvider != null && userProvider.user != null && userProvider.user.data != null) {
                    return RefreshIndicator(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/image/login_view.png'),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                                child: Container(
                                    child: Text(
                                      'My profile',
                                      style: setStyleContent(context,PsColors.black,24,FontWeight.bold),
                                    )),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              ListTile(
                                leading: Container(
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'http://vectips.com/wp-content/uploads/2019/11/tutorial-preview-large.png'))),
                                ),
                                title: Text(
                                  '${DrConfig.capitalLetter(userProvider.user.data.name)}',
                                  style: setStyleContent(context,PsColors.mainColorSecondary,15,FontWeight.normal),
                                ),
                                subtitle: Text(
                                  '${userProvider.user.data.email}',
                                  style: setStyleContent(context,PsColors.mainColorSecondary,14,FontWeight.w400),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              MenuWidget(
                                n: false,
                                title: 'My Adverts',
                                subtitle: 'Manage your adverts',
                                onTap: (() => {
                                  Navigator.push(context, MaterialPageRoute(builder:   (context) => MyAdvertTab(),),),
                                }),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                n: true,
                                title: 'Statistics',
                                subtitle: 'Reports of activities',
                                onTap: (() => {
                                 Navigator.push(context, MaterialPageRoute(builder:   (context) => StatisticsScreenIndex(),),),

                                }),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                n: true,
                                title: 'Get More Sales',
                                subtitle: 'Increase your sales',
                                onTap: (() => {
                                  Navigator.push(context, MaterialPageRoute(builder:   (context) => PackageIndexScreen(),),)
                                }),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                  n: false,
                                  title: "Manager's Call",
                                  //TODO: make dynamic address count
                                  subtitle: 'Manage calls',
                                  onTap:(){
                                    showModalBottomSheet(
                                        enableDrag: true,
                                        isDismissible: true,
                                        isScrollControlled: false,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                            )),
                                        context: context,
                                        builder: (BuildContext bc) {
                                          return Container(
                                              margin: EdgeInsets.only(top: 6,left: 5,right: 5),
                                              padding: EdgeInsets.all(15.0),
                                              height: 230,
                                              decoration: BoxDecoration(
                                                //color: PsColors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(13)),
                                              ),
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: Text('Do you want Ileoja manager to call you?',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      InkWell(
                                                        child: Container(
                                                          height: 52.0,
                                                          margin: EdgeInsets.all(15),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(60),
                                                              color: PsColors.mainColor,
                                                              border: Border.all(color: Colors.white)),
                                                          child: Center(
                                                              child: Text("YES, CALL NOW",
                                                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: PsColors.white, fontFamily: 'Montserrat'))),
                                                        ),
                                                        onTap: () async {
                                                          if (await Utils.checkInternetConnectivity()) {
                                                            final DrResource<UserModel> _apiStatus = await userProvider.updateManagerCall(
                                                              {
                                                                "call_manager": '',
                                                              },
                                                              psValueHolder.apiToken,
                                                            );
                                                            if (_apiStatus.data != null) {
                                                              //PsProgressDialog.dismissDialog();
                                                              context.showSuccessBar(content: Text('Manage call requested'));
                                                              Navigator.pop(context);

                                                            } else {
                                                              context.showErrorBar(content: Text(_apiStatus.message));
                                                             // PsProgressDialog.dismissDialog();
                                                            }
                                                          } else {
                                                            context.showErrorBar(content: Text("Bad internet connection"));
                                                           // PsProgressDialog.dismissDialog();
                                                          }

                                                        },
                                                      ),
                                                      InkWell(
                                                        child: Container(
                                                          height: 52.0,
                                                          margin: EdgeInsets.all(15),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(60),
                                                              color: Colors.black,
                                                              border: Border.all(color: Colors.black)),
                                                          child: Center(
                                                              child: Text("NO, CALL LATER",
                                                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: PsColors.white, fontFamily: 'Montserrat'))),
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                          );
                                        });
                                  }),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                  n: false,
                                  title: "Account Officer",
                                  //TODO: make dynamic address count
                                  subtitle: 'Account officer details',
                                  onTap: (() => {
                                    Navigator.push(context, MaterialPageRoute(builder:   (context) => AccountOfficer(),),)
                                  })),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                  n: false,
                                  title: 'Invite a friend',
                                  subtitle: 'Invite a friend and get rewarded ',
                                  onTap: (() => {
                                    Navigator.push(context, MaterialPageRoute(builder:   (context) => ShareScreen(),),)
                                  })), SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                  n: false,
                                  title: 'My Referral',
                                  subtitle: 'Manage Referral',
                                  onTap: (() => {
                                    Navigator.push(context, MaterialPageRoute(builder:   (context) => ReferralIndexScreen(),),)
                                  })),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                  n: false,
                                  title: 'My Balance',
                                  subtitle: 'Manage Balance',
                                  onTap: (() => {
                                    Navigator.push(context, MaterialPageRoute(builder:   (context) => MyBalanceIndex(data: userProvider.user.data),),)
                                  })),
                              MenuWidget(
                                  n: false,
                                  title: 'Special FB Ads',
                                  subtitle: 'Manage Special FB Adverts',
                                  onTap: (() => {
                                    Navigator.push(context, MaterialPageRoute(builder:   (context) => SpecialFB(),),)
                                  })),
                              MenuWidget(
                                  n: false,
                                  title: 'Top Ads',
                                  subtitle: 'Manage Top Adverts',
                                  onTap: (() => {
                                    Navigator.push(context, MaterialPageRoute(builder:   (context) => TopAds(),),)
                                  })),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                  n: false,
                                  title: 'FeedBack',
                                  subtitle: 'Manage feedbacks',
                                  onTap: (() => {
                                    Navigator.push(context, MaterialPageRoute(builder:   (context) => FeedBackTab(),),)
                                  })),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                n: false,
                                title: 'Followers',
                                subtitle: 'Manage Followers',
                                onTap: (() => {
                                  Navigator.push(context, MaterialPageRoute(builder:   (context) => FollowersTab(),),)
                                }),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                n: false,
                                title: 'Faq',
                                subtitle: 'Frequently Asked Questions',
                                onTap: (() => {
                                  Navigator.push(context, MaterialPageRoute(builder:   (context) => FaqEditIndex(),),)
                                }),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                n: false,
                                title: 'Notifications',
                                subtitle: 'Manage Notifications',
                                onTap: (() => {

                                }),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                n: false,
                                title: 'Settings',
                                subtitle: 'Manage Settings',
                                onTap: (() => {
                                  Navigator.push(context, MaterialPageRoute(builder:   (context) => UserSettingsIndex(),),)
                                }),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              MenuWidget(
                                n: false,
                                title: 'Logout',
                                subtitle: 'Leave the platform',
                                onTap: (() => {

                                }),
                              )
                            ],
                          ),
                        ),
                        onRefresh: (){
                          return userProvider.myProfile(Utils.checkUserLoginId(provider.psValueHolder),psValueHolder.apiToken);
                        });
                  }else{
                    return PSProgressIndicator(userProvider.user.status,context);
                  }
                }),
          )),
    );
  }
}
