
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
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

class EditChatScreen extends StatefulWidget {
  const EditChatScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final UserModel data;
  @override
  _EditChatScreenState createState() => _EditChatScreenState();
}

class _EditChatScreenState extends State<EditChatScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phone = new TextEditingController();
  Validations validations = new Validations();
  bool passwordVisible;
  bool remember = false;
  DrValueHolder psValueHolder;
  UserRepository userRepo;
  UserProvider userProvider;
  bool bindDataFirstTime = true;
  bool _value = false;


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
        title: Text('Update Chat Settings', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat')),
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
                      if(userProvider.user.data.chatFeedback == '1'){
                        _value = true;
                      }else{
                        _value = false;
                      }
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
                                      child: Text('Manage Chat',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
                                    ),
                                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                          child: Text('Receive Message',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
                                        ),
                                        PlatformSwitch(
                                            onChanged: (bool value) async {
                                              setState(() {
                                                _value = value;
                                              });
                                              if (await Utils.checkInternetConnectivity()) {
                                                //await PsProgressDialog.showDialog(context);
                                                final DrResource<UserModel> _apiStatus = await userProvider.postChatUpdate(
                                                  {
                                                    "chat_feedback": _value.toString(),
                                                  },
                                                  psValueHolder.apiToken,
                                                );
                                                if (_apiStatus.data != null) {
                                                  //PsProgressDialog.dismissDialog();
                                                  context.showSuccessBar(content: Text(_apiStatus.message));
                                                  Navigator.pop(context);

                                                } else {
                                                  context.showErrorBar(content: Text(_apiStatus.message));
                                                  //PsProgressDialog.dismissDialog();
                                                }
                                              } else {
                                                context.showErrorBar(content: Text("Bad internet connection"));
                                                //PsProgressDialog.dismissDialog();
                                              }
                                            },
                                            value: _value,
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
                                    Divider(color: Color(0xffDADADA),),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,right: 14, left: 14),
                                      child: Text('Chat help your customer to get touch with you through messages on Ileoja platform',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54, fontFamily: 'Montserrat')),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,right: 14, left: 14),
                                      child: Text(
                                          'You can turn Off this option if you dont want to reply to the messages( Your existed chats stay active)',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black54, fontFamily: 'Montserrat')),
                                    ),
                                    SizedBox(height: 30,)
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
