import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Screen/LoginAuth/loginScreenIndex.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterPage extends StatefulWidget{
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State <RegisterPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Register', style: TextStyle(fontFamily: 'Montserrat', fontSize: 18, fontWeight: FontWeight.w500, color: PsColors.black)),
        material: (_,__) => MaterialAppBarData(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      iosContentPadding: true,
      iosContentBottomPadding: true,
      body:  SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 5, right: 5, left: 5),
            padding: EdgeInsets.all(15),
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
                      hintText: 'Email',
                      hintStyle: TextStyle(),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                    ),
                   // controller: _oldPassword,
                    keyboardType: TextInputType.text,
                  ),
                  cupertino: (_, __) => CupertinoTextFieldData(
                    placeholder: 'Email',
                    cursorColor: PsColors.black,
                    clearButtonMode:
                    OverlayVisibilityMode.editing,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                   // controller: _oldPassword,
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          // passwordVisible
                          //  ? Icons.visibility
                          Icons.visibility_off,
                          color: Colors.black38,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            // passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                    ),
                    //controller: _newPassword,
                    keyboardType: TextInputType.text,
                  ),
                  cupertino: (_, __) => CupertinoTextFieldData(
                    placeholder: 'Password',
                    cursorColor: PsColors.black,
                    clearButtonMode:
                    OverlayVisibilityMode.editing,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    //controller: _newPassword,
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          // passwordVisible
                          //  ? Icons.visibility
                          Icons.visibility_off,
                          color: Colors.black38,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            // passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                    ),
                   // controller: _confirmNewPassword,
                    keyboardType: TextInputType.text,
                  ),
                  cupertino: (_, __) => CupertinoTextFieldData(
                    placeholder: 'Confirm Password',
                    cursorColor: PsColors.black,
                    clearButtonMode:
                    OverlayVisibilityMode.editing,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                   // controller: _confirmNewPassword,
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
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                    ),
                    // controller: _confirmNewPassword,
                    keyboardType: TextInputType.text,
                  ),
                  cupertino: (_, __) => CupertinoTextFieldData(
                    placeholder: 'Phone Number',
                    cursorColor: PsColors.black,
                    clearButtonMode:
                    OverlayVisibilityMode.editing,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    // controller: _confirmNewPassword,
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

          SizedBox(height: SizeConfig.screenHeight * 0.05),
            Align(
              alignment: Alignment.center,
              child: Text('By proceeding you agree to our ',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.00),
            Align(
              alignment: Alignment.center,
              child: Text('Terms and Conditions',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.mainColor, fontFamily: 'Montserrat')),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Container(
              padding: EdgeInsets.all(14),
              height: 50,
              child: GestureDetector(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('REGISTER',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: PsColors.white, fontFamily: 'Montserrat')),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },

              ),
              decoration:  BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ??", style: TextStyle(fontWeight: FontWeight.normal, fontFamily: 'Montserrat')),
                3.width,
                Text("Login", style: TextStyle(fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.mainColor)),
              ],
            ).onTap(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              // GSRegisterScreen().launch(context);
            })
          ],
        ),
      ),
    ]))));
  }
}