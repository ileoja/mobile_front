import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/ps_progress_dialog.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:provider/provider.dart';


class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  String locationName;
  TextEditingController _oldPassword =  new TextEditingController();
  TextEditingController _newPassword =  new TextEditingController();
  TextEditingController _confirmNewPassword =  new TextEditingController();

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
    SizeConfig().init(context);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: Text('Change Password', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
     // backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: ChangeNotifierProvider<UserProvider>(
            lazy: false,
            create: (BuildContext context) {
              final UserProvider provider =
              UserProvider(repo: userRepository, psValueHolder: psValueHolder);
              provider.myProfile(Utils.checkUserLoginId(provider.psValueHolder),psValueHolder.apiToken);
              userProvider = provider;
              return userProvider;
            },
            child: Consumer<UserProvider>(
                builder: (BuildContext context, UserProvider provider, Widget child) {
                  return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/login_view.png'),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              // height: SizeConfig.screenHeight,
                              decoration: BoxDecoration(
                                //color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[

                                  SizedBox(height: SizeConfig.screenHeight * 0.010),

                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        PlatformTextField(
                                          material: (_, __) => MaterialTextFieldData(
                                            cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                                            style: setStyleContent(context, Color(0xff666666), 15, FontWeight.normal),
                                            decoration:  InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: PsColors.mainColor, width: 1.0)),
                                              contentPadding: EdgeInsets.all(16),
                                              hintText: 'Enter Old Password',
                                              hintStyle: TextStyle(),
                                              labelText: 'Enter Old Password',
                                              labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                            ),
                                            controller: _oldPassword,
                                            keyboardType: TextInputType.text,
                                          ),
                                          cupertino: (_, __) => CupertinoTextFieldData(
                                            placeholder: 'Enter Old Password',
                                            cursorColor: PsColors.black,
                                            clearButtonMode:
                                            OverlayVisibilityMode.editing,
                                            keyboardType: TextInputType.text,
                                            autocorrect: false,
                                            controller: _oldPassword,
                                            placeholderStyle: setStyleContent(context, Colors.grey, 16, FontWeight.normal),
                                            style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 11, FontWeight.normal),
                                            decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(
                                                width: 0,
                                                color: CupertinoColors.inactiveGray,),
                                              ),),
                                          ),
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.03),
                                        PlatformTextField(
                                          material: (_, __) => MaterialTextFieldData(
                                            cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                                            style: setStyleContent(context, Color(0xff666666), 15, FontWeight.normal),
                                            decoration:  InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: PsColors.mainColor, width: 1.0)),
                                              contentPadding: EdgeInsets.all(16),
                                              hintText: 'Enter New Password',
                                              hintStyle: TextStyle(),
                                              labelText: 'Enter New Password',
                                              labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                            ),
                                            controller: _newPassword,
                                            keyboardType: TextInputType.text,
                                          ),
                                          cupertino: (_, __) => CupertinoTextFieldData(
                                            placeholder: 'NEW PASSWORD',
                                            cursorColor: PsColors.black,
                                            clearButtonMode:
                                            OverlayVisibilityMode.editing,
                                            keyboardType: TextInputType.text,
                                            autocorrect: false,
                                            controller: _newPassword,
                                            placeholderStyle: setStyleContent(context, Colors.grey, 16, FontWeight.normal),
                                            style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 11, FontWeight.normal),
                                            decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(
                                                width: 0,
                                                color: CupertinoColors.inactiveGray,),
                                              ),),
                                          ),
                                        ),
                                        SizedBox(height: SizeConfig.screenHeight * 0.03),
                                        PlatformTextField(
                                          material: (_, __) => MaterialTextFieldData(
                                            cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                                            style: setStyleContent(context, Color(0xff666666), 15, FontWeight.normal),
                                            decoration:  InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: PsColors.mainColor, width: 1.0)),
                                              contentPadding: EdgeInsets.all(16),
                                              hintText: 'Enter Password Confirmation',
                                              hintStyle: TextStyle(),
                                              labelText: 'Enter Password Confirmation',
                                              labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                            ),
                                            controller: _confirmNewPassword,
                                            keyboardType: TextInputType.text,
                                          ),
                                          cupertino: (_, __) => CupertinoTextFieldData(
                                            placeholder: 'Enter Password Confirmation',
                                            cursorColor: PsColors.black,
                                            clearButtonMode:
                                            OverlayVisibilityMode.editing,
                                            keyboardType: TextInputType.text,
                                            autocorrect: false,
                                            controller: _confirmNewPassword,
                                            placeholderStyle: setStyleContent(context, Colors.grey, 16, FontWeight.normal),
                                            style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 11, FontWeight.normal),
                                            decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(
                                                width: 0,
                                                color: CupertinoColors.inactiveGray,),
                                              ),),
                                          ),
                                        ),
                                       // SizedBox(height: SizeConfig.screenHeight * 0.03),
                                      ],
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      child: Container(
                                        height: 52.0,
                                        margin: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: PsColors.mainColor,
                                            border: Border.all(color: Colors.white)),
                                        child: Center(
                                            child: Text("RESET PASSWORD",
                                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: PsColors.white, fontFamily: 'Montserrat'))),
                                      ),
                                      onTap: () async {

                                        if (await Utils.checkInternetConnectivity()) {
                                          await PsProgressDialog.showDialog(context);
                                          final DrResource<UserModel> _apiStatus = await userProvider.updateUserPassword(
                                            {
                                              "old_password": _oldPassword.text,
                                              "password": _newPassword.text,
                                              "password_confirmation": _confirmNewPassword.text,
                                            },
                                            psValueHolder.apiToken,
                                          );
                                          if (_apiStatus.data != null) {
                                            context.showSuccessBar(content: Text(_apiStatus.message));
                                            PsProgressDialog.dismissDialog();

                                          } else {
                                            context.showErrorBar(content: Text(_apiStatus.message));
                                            PsProgressDialog.dismissDialog();
                                          }
                                        } else {
                                          context.showErrorBar(content: Text("Bad internet connection"));
                                          PsProgressDialog.dismissDialog();
                                        }

                                      },
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.safeHeight * 0.005),
                                ],
                              ),
                            ),

                            //new file here
                          ],
                        ),
                      )
                  );
                }),
          )),
    );
  }
}
