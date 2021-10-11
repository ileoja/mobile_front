import 'dart:io';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/LocalGovModel.dart';
import 'package:ileoja/Model/StateModel.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Mics/lgaState.dart';
import 'package:ileoja/Screen/Mics/stateScreen.dart';
import 'package:ileoja/Screen/Widget/micsWidgetScreen.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/ps_progress_dialog.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:ileoja/acadaar_ctrl/validations.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final UserModel data;
  @override
  _UpdateUserScreenState createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullName = new TextEditingController();
  final TextEditingController _eMail = new TextEditingController();
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _userName = new TextEditingController();
  final TextEditingController _address = new TextEditingController();
  final TextEditingController _country = new TextEditingController();
  final TextEditingController state = new TextEditingController();
  final TextEditingController _lga = new TextEditingController();
  final TextEditingController lga = new TextEditingController();
  final TextEditingController _state = new TextEditingController();

  Validations validations = new Validations();
  bool passwordVisible;
  bool remember = false;

  DrValueHolder psValueHolder;
  UserRepository userRepo;
  UserProvider userProvider;
  bool bindDataFirstTime = true;
  StateModel _stateModel;
  LGAModel _lgaModel;

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
      appBar: PlatformAppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: PsColors.black, fontFamily: 'Montserrat'),),
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
                builder: (BuildContext context, UserProvider provider, Widget child) {
                  if (userProvider != null &&
                      userProvider.user != null &&
                      userProvider.user.data != null) {

                    if (bindDataFirstTime) {
                      _fullName.text = userProvider.user.data.name;
                      _eMail.text = userProvider.user.data.email;
                      _phone.text = userProvider.user.data.phone;
                      _userName.text = userProvider.user.data.username;
                      _address.text = userProvider.user.data.address;
                      state.text = userProvider.user.data.state;
                      _lga.text = userProvider.user.data.city;
                      lga.text = userProvider.user.data.state;
                      bindDataFirstTime = false;
                    }
                    return SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 11),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/image/login_view.png'))),
                          child: Column(
                            children: [
                              _ImageWidget(userProvider: userProvider),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(color: Colors.transparent),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      PlatformTextField(
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
                                                  hintText: 'Enter your Full Name',
                                                  hintStyle: TextStyle(),
                                                  labelText: 'Enter your Full Name',
                                                  labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                ),
                                                controller: _fullName,
                                                keyboardType: TextInputType.text,
                                              ),
                                          cupertino: (_, __) =>
                                              CupertinoTextFieldData(
                                                placeholder: 'FullName',
                                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                clearButtonMode: OverlayVisibilityMode.editing,
                                                keyboardType: TextInputType.text,
                                                autocorrect: false,
                                                controller: _fullName,
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
                                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                                      PlatformTextField(
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
                                                  hintText: 'Enter your Email',
                                                  hintStyle: TextStyle(),
                                                  labelText: 'Enter your Email',
                                                  labelStyle:TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                ),
                                                controller: _eMail,
                                                keyboardType: TextInputType.text,
                                              ),
                                          cupertino: (_, __) =>
                                              CupertinoTextFieldData(
                                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                placeholder: 'Email',
                                                clearButtonMode: OverlayVisibilityMode.editing,
                                                keyboardType: TextInputType.text,
                                                autocorrect: false,
                                                controller: _eMail,
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
                                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                                      PlatformTextField(
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
                                                  hintText: 'Enter your User Name',
                                                  hintStyle: TextStyle(),
                                                  labelText: 'Enter your User Name',
                                                  labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),

                                                ),
                                                controller: _userName,
                                                keyboardType: TextInputType.text,
                                              ),
                                          cupertino: (_, __) =>
                                              CupertinoTextFieldData(
                                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                placeholder: 'Username',
                                                clearButtonMode: OverlayVisibilityMode.editing,
                                                keyboardType: TextInputType.text,
                                                autocorrect: false,
                                                controller: _userName,
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
                                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                                      PlatformTextField(
                                          material: (_, __)  => MaterialTextFieldData(
                                            style: setStyleContent(context, Color(0xff666666), 15, FontWeight.normal),
                                            decoration:  InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: PsColors.mainColor, width: 1.0)),
                                              contentPadding: EdgeInsets.all(16),
                                              hintText: 'Enter your Phone Number',
                                              hintStyle: TextStyle(),
                                              labelText: 'Enter your Phone Number',
                                              labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                            ),
                                            controller: _phone,
                                            keyboardType: TextInputType.phone,
                                          ),
                                          cupertino: (_, __) => CupertinoTextFieldData(
                                            style: setStyleContent(context, Color(0xff666666), 15, FontWeight.normal),
                                            placeholder: 'Phone Number',
                                            controller: _phone,
                                            clearButtonMode: OverlayVisibilityMode.editing,
                                            keyboardType: TextInputType.number,
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
                                        //controller: textControlller,
                                      ),
                                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                                      PlatformTextField(
                                          material: (_, __) =>
                                              MaterialTextFieldData(
                                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                decoration:  InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: PsColors.mainColor, width: 1.0)),
                                                  contentPadding: EdgeInsets.all(16),
                                                  hintText: 'Enter your Address',
                                                  hintStyle: TextStyle(),
                                                  labelText: 'Enter your Address',
                                                  labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                ),
                                                controller: _address,
                                                keyboardType: TextInputType.text,
                                              ),
                                          cupertino: (_, __) =>
                                              CupertinoTextFieldData(
                                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                placeholder: 'Address',
                                                clearButtonMode: OverlayVisibilityMode.editing,
                                                keyboardType: TextInputType.text,
                                                autocorrect: false,
                                                controller: _address,
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
                                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                                      InkWell(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                                          child: Row(
                                            children: <Widget>[
                                              Text(_state.text == ''? 'Select State':_state.text,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
                                              Spacer(),
                                              Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey.shade700,size: 16,),
                                              Container(width: 10)
                                            ],
                                          ),
                                          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5), borderRadius: BorderRadius.circular(5)),
                                        ),
                                        onTap: () async {
                                          final result = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => StateScreen(),
                                              ));
                                          setState(() {
                                            _stateModel = result;
                                            _state.text = _stateModel.name;
                                            state.text = _stateModel.id;
                                            _lga.clear();
                                          });

                                          // print('result ${_stateModel.name}');
                                        },
                                      ),

                                      SizedBox(height: SizeConfig.screenHeight * 0.01),
                                      InkWell(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                                          child: Row(
                                            children: <Widget>[
                                              Text(_lga.text == null?'Local Government':_lga.text,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
                                              Spacer(),
                                              Icon(Icons.keyboard_arrow_down_sharp, color: Colors.grey.shade700,size: 16,),
                                              Container(width: 10)
                                            ],
                                          ),
                                          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5), borderRadius: BorderRadius.circular(5)),
                                        ),
                                        onTap: () async {
                                          final result = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LGAScreen(data:_stateModel.id,),
                                              ));
                                          setState(() {
                                            _lgaModel = result;
                                            _lga.text = _lgaModel.name;
                                            lga.text = _lgaModel.id;
                                          });

                                          // print('result ${_stateModel.name}');
                                        },
                                      ),



                                      SizedBox(height: SizeConfig.screenHeight * 0.02),

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
                                                child: Text("UPDATE PROFILE",
                                                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: PsColors.white, fontFamily: 'Montserrat'))),
                                          ),
                                          onTap: () async {
                                            if (await Utils.checkInternetConnectivity()) {
                                              await PsProgressDialog.showDialog(context);
                                              final DrResource<UserModel> _apiStatus = await userProvider.postProfileUpdate(
                                                {
                                                  "name": _fullName.text,
                                                  "email": _eMail.text,
                                                  "phone": _phone.text,
                                                  "address": _address.text,
                                                  "username": _userName.text,
                                                  "state": state.text,
                                                  "city": state.text,
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
                                    ]),
                              ),
                            ],
                          ),
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

class _ImageWidget extends StatefulWidget {
  const _ImageWidget({this.userProvider});
  final UserProvider userProvider;

  @override
  __ImageWidgetState createState() => __ImageWidgetState();
}

File pickedImage;
List<Asset> images = <Asset>[];

class __ImageWidgetState extends State<_ImageWidget> {
  Future<bool> requestGalleryPermission() async {
    final Permission _photos = Permission.photos;
    final PermissionStatus permissionStatus = await _photos.request();

    if (permissionStatus != null && permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _pickImage() async {
      List<Asset> resultList = <Asset>[];
      try {
        resultList = await MultiImagePicker.pickImages(
          maxImages: 1,
          enableCamera: true,
          selectedAssets: images,
          cupertinoOptions: CupertinoOptions(
              takePhotoIcon: 'chat',
              backgroundColor: '' +
                  Utils.convertColorToString(PsColors.whiteColorWithBlack)),
          materialOptions: MaterialOptions(
            actionBarColor: Utils.convertColorToString(PsColors.black),
            actionBarTitleColor: Utils.convertColorToString(PsColors.white),
            statusBarColor: Utils.convertColorToString(PsColors.black),
            lightStatusBar: false,
            actionBarTitle: '',
            allViewTitle: 'All Photos',
            useDetailsView: false,
            selectCircleStrokeColor:
            Utils.convertColorToString(PsColors.mainColor),
          ),
        );
      } on Exception catch (e) {
        e.toString();
      }
      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) {
        return;
      }
      images = resultList;
      setState(() {});

      if (images.isNotEmpty) {
        await PsProgressDialog.showDialog(context);
        final DrResource<UserModel> _apiStatus = await widget.userProvider
            .postImageUpload(widget.userProvider.psValueHolder.id,await Utils.getImageFileFromAssets(images[0], DrConfig.profileImageSize),widget.userProvider.psValueHolder.apiToken);
        if (_apiStatus.data != null) {
          PsProgressDialog.dismissDialog();
          setState(() {
            widget.userProvider.user.data = _apiStatus.data;
          });
        }
        PsProgressDialog.dismissDialog();
      }
    }

    final Widget _imageWidget = MiscNetworkImageWithUrl(
      photoKey: '',
      imagePath: widget.userProvider.user.data.image,
      width: double.infinity,
      height: 200,
      boxfit: BoxFit.cover,
      onTap: () {},
    );

    final Widget _editWidget = Container(
      child: IconButton(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: 2),
        iconSize: 24,
        icon: Icon(
          Icons.edit,
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () async {
          if (await Utils.checkInternetConnectivity()) {
            requestGalleryPermission().then((bool status) async {
              if (status) {
                await _pickImage();
              }
            });
          } else {
            context.showErrorBar(content: Text("Bad internet connection"));
          }
        },
      ),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: PsColors.mainColor),
        color: PsColors.backgroundColor,
        borderRadius: BorderRadius.circular(28),
      ),
    );

    final Widget _imageInCenterWidget = Positioned(
        top: 110,
        child: Stack(
          children: <Widget>[
            Container(
                width: 90,
                height: 90,
                child: CircleAvatar(
                  child: MiscNetworkCircleImage(
                    photoKey: '',
                    imagePath: widget.userProvider.user.data.image,
                    width: double.infinity,
                    height: 200,
                    boxfit: BoxFit.cover,
                    onTap: () async {
                      if (await Utils.checkInternetConnectivity()) {
                        requestGalleryPermission().then((bool status) async {
                          if (status) {
                            await _pickImage();
                          }
                        });
                      } else {
                        context.showErrorBar(content: Text("Bad internet connection"));
                      }
                    },
                  ),
                )),
            Positioned(
              top: 1,
              right: 1,
              child: _editWidget,
            ),
          ],
        ));


    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 160,
          child: _imageWidget,
        ),
        Container(
          color: PsColors.white.withAlpha(100),
          width: double.infinity,
          height: 160,
        ),
        Container(
          width: double.infinity,
          height: 220,
        ),
        _imageInCenterWidget,
      ],
    );
  }
}
