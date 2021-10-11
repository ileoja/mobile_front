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
import 'package:ileoja/acadaar_ctrl/validations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
    this.onProfileSelected,
  }) : super(key: key);
  final Function onProfileSelected;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  Validations validations = new Validations();
  bool passwordVisible;
  bool remember = false;
  UserRepository userRepo;
  UserProvider userProvider;
  DrValueHolder psValueHolder;

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

  @override
  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);
    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: SingleChildScrollView(
          child: ChangeNotifierProvider<UserProvider>(
            lazy: false,
            create: (BuildContext context) {
              final UserProvider provider =
              UserProvider(repo: userRepo, psValueHolder: psValueHolder);
              // print(provider.psValueHolder.apiToken);
              print(Utils.checkUserLoginId(provider.psValueHolder));
              return provider;
            },
            child: Consumer<UserProvider>(
                builder: (BuildContext context, UserProvider provider, Widget child) {
                  return SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/screen_bg.png'))),
                        height: MediaQuery.of(context).size.height,
                        child: Container(
                          margin: EdgeInsets.only(right: 5, left: 5),
                          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                          height: MediaQuery.of(context).size.height,
                          child: new Column(
                            children: [
                              SizedBox(height: SizeConfig.screenHeight * 0.08),
                              Container(
                                padding: EdgeInsets.only(top: 100.0),
                                child: Center(
                                    child: Image.asset(
                                      'assets/image/logomain.png',
                                      width: 250,
                                    )),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.05),
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    PlatformTextField(
                                        material: (_, __)  => MaterialTextFieldData(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: PsColors.mainColorTextField,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(2)),
                                              borderSide: BorderSide(width: 1,color: Colors.grey.shade300),
                                            ),
                                            contentPadding: EdgeInsets.all(8),
                                            labelText: 'Username',
                                            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                          ),
                                          controller: _username,
                                          keyboardType: TextInputType.text,
                                        ),
                                        cupertino: (_, __) => CupertinoTextFieldData(
                                          placeholder: 'Your Username',
                                          clearButtonMode: OverlayVisibilityMode.editing,
                                          keyboardType: TextInputType.text,
                                          autocorrect: false,
                                          controller: _username,
                                          prefix: Image.asset('image/icon_email.png'),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                width: 0,
                                                color: CupertinoColors.inactiveGray,
                                              ),
                                            ),
                                          ),
                                        )
                                      //controller: textControlller,
                                    ),
                                    SizedBox(
                                        height: SizeConfig.getScaledSizeHeight(10)),
                                    PlatformTextField(
                                        material: (_, __)  => MaterialTextFieldData(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: PsColors.mainColorTextField,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(2)),
                                              borderSide: BorderSide(width: 1,color: Colors.grey.shade300),
                                            ),
                                            contentPadding: EdgeInsets.all(8),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.black38,
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  passwordVisible = !passwordVisible;
                                                });
                                              },
                                            ),
                                            labelText: 'Password',
                                            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                          ),
                                          controller: password,
                                          keyboardType: TextInputType.visiblePassword,
                                        ),
                                        cupertino: (_, __) => CupertinoTextFieldData(
                                          placeholder: 'Password',
                                          clearButtonMode: OverlayVisibilityMode.editing,
                                          keyboardType: TextInputType.visiblePassword,
                                          autocorrect: false,
                                          controller: password,
                                          suffix: IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.black38,
                                            ),
                                            onPressed: () {
                                              // Update the state i.e. toogle the state of passwordVisible variable
                                              setState(() {
                                                passwordVisible = !passwordVisible;
                                              });
                                            },
                                          ),
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
                                    SizedBox(
                                        height: SizeConfig.getScaledSizeHeight(30)),

                                    PlatformButton(
                                        onPressed: () async {
                                          if (await Utils.checkInternetConnectivity()) {
                                            userProvider = Provider.of<UserProvider>(
                                                context,
                                                listen: false);
                                            await userProvider.loginWithEmailId(
                                                context,
                                                _username.text,
                                                password.text);
                                          }else{

                                          }
                                        },
                                        child: PlatformText('Login',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.white, fontFamily: 'Montserrat'),),
                                        material: (_, __)  => MaterialRaisedButtonData(
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                                            color: PsColors.mainColor,
                                            textColor: PsColors.white
                                        ),
                                        cupertino: (_, __) => CupertinoButtonData(
                                          color: PsColors.mainColor,
                                        )
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child:  Text('Forgot your password?',style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: PsColors.black, fontFamily: 'Montserrat'),),

                                    onTap: (){
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => ForgotPasswordScreen()));
                                    },
                                  ),

                                  SizedBox(width: 10,),

                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => SignUpScreen()));
                                    },
                                    child: PlatformText('Sign Up',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: PsColors.mainColor, fontFamily: 'Montserrat'),),

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  );
                }),
          )),
    );
  }
}
