
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class EditPhoneScreen extends StatefulWidget {
  const EditPhoneScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final UserModel data;
  @override
  _EditPhoneScreenState createState() => _EditPhoneScreenState();
}

class _EditPhoneScreenState extends State<EditPhoneScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phone = new TextEditingController();
  final _mobileFormatter = NumberTextInputFormatter();
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

  @override
  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Update Phone Settings', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
                      phoneFormat(_phone.text);
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
                                    margin: EdgeInsets.only(top: 5, right: 14, left: 14),
                                    child: PlatformTextField(
                                        controller: _phone,
                                        material: (_, __) =>
                                            MaterialTextFieldData(
                                              style: setStyleContent(context, Color(0xff666666), 15, FontWeight.normal),
                                              decoration:  InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: PsColors.mainColor, width: 1.0)),
                                                contentPadding: EdgeInsets.all(16),
                                                hintText: 'Phone Number',
                                                hintStyle: TextStyle(),
                                                labelText: 'Phone Number',
                                                labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                              ),
                                              maxLength: 15,
                                              inputFormatters: <TextInputFormatter>[
                                                 FilteringTextInputFormatter.digitsOnly,
                                                _mobileFormatter,
                                              ],
                                              keyboardType: TextInputType.phone,
                                            ),
                                        cupertino: (_, __) =>
                                            CupertinoTextFieldData(
                                              placeholder: 'Phone Number',
                                              style:TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                              clearButtonMode: OverlayVisibilityMode.editing,
                                              keyboardType: TextInputType.text,
                                              autocorrect: false,
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 0,
                                                    color: CupertinoColors.inactiveGray,
                                                  ),
                                                ),
                                              ),
                                            )
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.screenHeight * 0.01),
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
                                            child: Text("CONFIRM PHONE NUMBER",
                                                style:TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: PsColors.white, fontFamily: 'Montserrat'))),
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

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ' ');
      if (newValue.selection.end >= 2) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}