
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:ileoja/acadaar_ctrl/validations.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class SocialAccountScreen extends StatefulWidget {
  const SocialAccountScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final UserModel data;
  @override
  _SocialAccountScreenState createState() => _SocialAccountScreenState();
}

class _SocialAccountScreenState extends State<SocialAccountScreen> {

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
        title: Text('Social Account Settings', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 5, right: 10, left: 10),
                                          child:Image.asset(DrConfig.getImage('facebook.png'),height: 50,),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Connect Facebook ',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              ' Sign in to your account using the Facebook profile. Publish product in your profile or Facebook Page',
                                              style:TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black54, fontFamily: 'Montserrat'),
                                            ),
                                            SizedBox(height: 6),
                                          ],
                                        ),)
                                      ],
                                    ),
                                    Divider(color: Color(0xffDADADA),),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 5, right: 10, left: 10),
                                          child:Image.asset(DrConfig.getImage('google.png'),height: 50,),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Connect Google+ ',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),
                                            ),
                                            SizedBox(height: 6),
                                            Text(
                                              'Sign in to your account using the Facebook profile. Publish product in your profile or Facebook Page',
                                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black54, fontFamily: 'Montserrat'),
                                            ),
                                            SizedBox(height: 6),
                                          ],
                                        ),)
                                      ],
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
