import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:provider/provider.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  @override
  _ConfirmPasswordScreenState createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  String locationName;
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
        title: textStyle(context, "Change Password", 18, PsColors.black),
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
      backgroundColor: Colors.white,
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

                            SizedBox(height: SizeConfig.screenHeight * 0.010),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  PlatformTextField(
                                    material: (_, __) => MaterialTextFieldData(
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                                      style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 14, FontWeight.normal),
                                      decoration: InputDecoration(labelStyle: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.3), 11, FontWeight.normal),
                                        labelText: 'NEW PASSWORD',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                                        ),
                                        border: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                        focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                      ),
                                      controller: _newPassword,
                                      keyboardType: TextInputType.text,
                                    ),
                                    cupertino: (_, __) => CupertinoTextFieldData(
                                      style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 11, FontWeight.normal),
                                      placeholder: 'NEW PASSWORD',
                                      cursorColor: PsColors.black,
                                      clearButtonMode:
                                      OverlayVisibilityMode.editing,
                                      placeholderStyle: setStyleContent(context, Colors.grey, 16, FontWeight.normal),
                                      keyboardType: TextInputType.text,
                                      autocorrect: false,
                                      controller: _newPassword,
                                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0, color: CupertinoColors.inactiveGray,
                                      ),),),
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                                  PlatformTextField(
                                    material: (_, __) => MaterialTextFieldData(
                                      cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                                      style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 14, FontWeight.normal),
                                      decoration: InputDecoration(labelStyle: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.3), 11, FontWeight.normal),
                                        labelText: 'CONFIRM PASSWORD',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                                        ),
                                        border: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                        focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1))),
                                      ),
                                      controller: _confirmNewPassword,
                                      keyboardType: TextInputType.text,
                                    ),
                                    cupertino: (_, __) => CupertinoTextFieldData(
                                      style: setStyleContent(context, Color.fromRGBO(0, 0, 0, 0.7), 11, FontWeight.normal),
                                      placeholder: 'CONFIRM PASSWORD',
                                      cursorColor: PsColors.black,
                                      clearButtonMode:
                                      OverlayVisibilityMode.editing,
                                      placeholderStyle: setStyleContent(context, Colors.grey, 16, FontWeight.normal),
                                      keyboardType: TextInputType.text,
                                      autocorrect: false,
                                      controller: _confirmNewPassword,
                                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0, color: CupertinoColors.inactiveGray,
                                      ),),),
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.screenHeight * 0.01),

                                ],
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                child: Container(
                                  height: 52.0,
                                  width: SizeConfig.safeWidth-110,
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: PsColors.mainColor,
                                      border: Border.all(color: Colors.white)),
                                  child: Center(
                                      child: Text("Change Password",
                                          style: setStyleContent(context, PsColors.white,
                                              14, FontWeight.w700))),
                                ),
                                onTap: () async {

                                  // if (await Utils.checkInternetConnectivity()) {
                                  //   await PsProgressDialog.showDialog(context);
                                  //   final DrResource<UserModel> _apiStatus = await userProvider.updatePassword(
                                  //     {
                                  //       "password": _newPassword.text,
                                  //       "password_confirmation": _confirmNewPassword.text,
                                  //     },
                                  //     psValueHolder.apiToken,
                                  //   );
                                  //   if (_apiStatus.data != null) {
                                  //     context.showSuccessBar(content: Text(_apiStatus.message));
                                  //     Navigator.pop(context);
                                  //   } else {
                                  //     context.showErrorBar(content: Text(_apiStatus.message));
                                  //     PsProgressDialog.dismissDialog();
                                  //   }
                                  // } else {
                                  //   context.showErrorBar(content: Text("Bad internet connection"));
                                  //   PsProgressDialog.dismissDialog();
                                  // }

                                },
                              ),
                            ),
                            SizedBox(height: SizeConfig.safeHeight * 0.005),
                          ],
                        ),
                      )
                  );
                }),
          )),
    );
  }
}
