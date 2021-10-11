import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Profile/UserSettings/ProfileEdit/chatEdit.dart';
import 'package:ileoja/Screen/Profile/UserSettings/ProfileEdit/editProfile.dart';
import 'package:ileoja/Screen/Profile/UserSettings/ProfileEdit/feedbackEdit.dart';
import 'package:ileoja/Screen/Profile/UserSettings/ProfileEdit/manageAccount.dart';
import 'package:ileoja/Screen/Profile/UserSettings/ProfileEdit/notificationSettings.dart';
import 'package:ileoja/Screen/Profile/UserSettings/ProfileEdit/phoneEdit.dart';
import 'package:ileoja/Screen/Profile/UserSettings/ProfileEdit/socialAccountEdit.dart';
import 'package:ileoja/Screen/Profile/UserSettings/passwordReset/resetPassword.dart';
import 'package:ileoja/Screen/Widget/widgetMenu.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class UserSettingsIndex extends StatefulWidget {
  const UserSettingsIndex({
    Key key,
    this.action,
  }) : super(key: key);
  final bool action;
  @override
  _UserSettingsIndexState createState() => _UserSettingsIndexState();
}

class _UserSettingsIndexState extends State<UserSettingsIndex> {
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;

  @override
  void initState() {
   // loadBack();
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
    //  userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: Text('User Settings', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
                            SettingsMenuWidget(
                                title: 'Contact Details',
                                onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => UpdateUserScreen(data:userProvider.user.data ,),))
                                }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'Phone number settings',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => EditPhoneScreen(data:userProvider.user.data ,),))
                              }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'Chat settings',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => EditChatScreen(data:userProvider.user.data ,),))
                              }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'FeedBack settings',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => EditFeedBackScreen(data:userProvider.user.data ,),))
                              }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'Social settings',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => SocialAccountScreen(data:userProvider.user.data ,),))
                              }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'Notification settings',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => NotificationScreen(data:userProvider.user.data ,),))
                              }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'Change password',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => ChangePasswordScreen(),))
                              }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'Manage Account',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => ManageAccount(data:userProvider.user.data ,),))
                              }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'Rate Us',
                              onTap: (() => {

                              }),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            SettingsMenuWidget(
                              title: 'About Us',
                              onTap: (() => {
                                Navigator.push(context, MaterialPageRoute(builder:   (context) => UpdateUserScreen(data:userProvider.user.data ,),))
                              }),
                            ),
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
