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
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:ileoja/acadaar_ctrl/validations.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({
    Key key,
    @required this.data,
  }) : super(key: key);
  final UserModel data;
  @override
  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {

  final TextEditingController _phone = new TextEditingController();
  Validations validations = new Validations();
  bool passwordVisible;
  bool remember = false;
  DrValueHolder psValueHolder;
  UserRepository userRepo;
  UserProvider userProvider;
  bool bindDataFirstTime = true;

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
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Manage Account', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
          child: ChangeNotifierProvider<UserProvider>(
            lazy: false,
            create: (BuildContext context) {
              final UserProvider provider =
              UserProvider(repo: userRepo, psValueHolder: psValueHolder);
              provider.myProfile(Utils.checkUserLoginId(provider.psValueHolder),psValueHolder.apiToken);
              userProvider = provider;
              return userProvider;
            },
            child: Consumer<UserProvider>(
                builder: (BuildContext context, UserProvider provider, Widget child)  {
                  if (userProvider != null &&
                      userProvider.user != null &&
                      userProvider.user.data != null) {
                    if (bindDataFirstTime)  {
                      _phone.text = userProvider.user.data.phone;
                      // _value = toBoolean(userProvider.user.data.chatFeedback);
                      bindDataFirstTime = false;
                    }
                    return SingleChildScrollView(
                        child: Container(
                            margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 11),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,right: 14, left: 14),
                                      alignment: Alignment.topLeft,
                                      child: Text('Delete Account',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: PsColors.black, fontFamily: 'Montserrat')),
                                    ),
                                    Divider(color: Color(0xffDADADA),),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,right: 14, left: 14),
                                      child: Text('Account deactivation means to delete your account: you will not be able to log in to your profile anymore, and all your account history will be removed without the possibility to restore',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54, fontFamily: 'Montserrat')),
                                    ),
                                    SizedBox(height: 30,),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: InkWell(
                                        child: Container(
                                          height: 52.0,
                                          margin: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(60),
                                              color: PsColors.mainColor,
                                              border: Border.all(color: Colors.white)),
                                          child: Center(
                                              child: Text("DELETE MY ACCOUNT",
                                                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: PsColors.white, fontFamily: 'Montserrat'))),
                                        ),
                                        onTap: () async {

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
                                                          child: Text('Are you sure you want delete your account?',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
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
                                                                    child: Text("YES, CONTINUE",
                                                                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Colors.black54, fontFamily: 'Montserrat'))),
                                                              ),
                                                              onTap: () async {
                                                                if (await Utils.checkInternetConnectivity()) {
                                                                  await PsProgressDialog.showDialog(context);
                                                                  final DrResource<UserModel> _apiStatus = await userProvider.postPhoneUpdate(
                                                                    {
                                                                      "phone": _phone.text,
                                                                    },
                                                                    psValueHolder.apiToken,
                                                                  );
                                                                  if (_apiStatus.data != null) {
                                                                    //PsProgressDialog.dismissDialog();
                                                                    context.showSuccessBar(content: Text(_apiStatus.message));
                                                                    Navigator.pop(context);

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

                                                            SizedBox(height: 2,),
                                                            InkWell(
                                                              child: Container(
                                                                height: 52.0,
                                                                margin: EdgeInsets.all(15),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(60),
                                                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                                                    border: Border.all(color: Colors.white)),
                                                                child: Center(
                                                                    child: Text("NO, I DON'T ",
                                                                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: PsColors.white, fontFamily: 'Montserrat'))),
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

                                        },
                                      ),
                                    ),
                                  ],
                                )
                            )
                        )
                    );
                  }else{
                    return PSProgressIndicator(userProvider.user.status,context);
                  }
                }),
          )),
    );
  }
}
