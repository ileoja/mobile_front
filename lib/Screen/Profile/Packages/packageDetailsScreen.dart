import 'dart:io';

import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/PackageModel.dart';
import 'package:ileoja/Provider/packages/packages_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/packages_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/widgetPackage.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/ps_progress_dialog.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:provider/provider.dart';

class PackageDetailsScreen extends StatefulWidget {
  final PackageModel data;
  final Function onTap;

  const PackageDetailsScreen(
      {Key key,
        @required this.data,
        this.onTap,})
      : super(key: key);
  @override
  _PackageDetailsScreenState createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  PackagesProvider _packagesProvider;
  PackagesRepository _packagesRepository;
  int selectedPaymentMethod = 1;
  final plugin = PaystackPlugin();
  int _radioValue = 0;
  CheckoutMethod _method = CheckoutMethod.selectable;
  bool _inProgress = false;
  String _cardNumber;
  String _cvv;
  int _expiryMonth;
  int _expiryYear;

  var banks = ['Selectable', 'Bank', 'Card'];

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return '${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  CheckoutMethod _parseStringToMethod(String string) {
    CheckoutMethod method = CheckoutMethod.selectable;
    switch (string) {
      case 'Bank':
        method = CheckoutMethod.bank;
        break;
      case 'Card':
        method = CheckoutMethod.card;
        break;
    }
    return method;
  }

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: DrConfig.dr_pay_stack_key);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _changePaymentMethod(int method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }





  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    _packagesRepository = Provider.of<PackagesRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: textStyle(context, "${widget.data.name}", 18, PsColors.black),
        trailingActions: [
          PlatformIconButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmergencyScreen()));
              //AddEmergencyScreen
              _selectPaymentMethod(context);
            },
            materialIcon: Icon(Icons.add),
            cupertinoIcon: Icon(
              CupertinoIcons.add,
              size: 28.0,
            ),
          )
        ],
        material: (_, __)  => MaterialAppBarData(
          centerTitle: false,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(),
      ),
      body: ChangeNotifierProvider<PackagesProvider>(
        lazy: false,
        create: (BuildContext context) {
          final PackagesProvider provider = PackagesProvider(repo: _packagesRepository,psValueHolder: psValueHolder);
          _packagesProvider = provider;
          return _packagesProvider;
        },
        child: Consumer<PackagesProvider>(
            builder: (BuildContext context, PackagesProvider provider, Widget child) {
              return SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0),),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Info", style: setStyleContent(context,PsColors.mainColor,16,FontWeight.bold)),
                              ],
                            ),
                          ),
                          Container(height: 10),
                          InkWell(
                            highlightColor: Colors.grey.withOpacity(0.1),
                            splashColor: Colors.grey.withOpacity(0.1),
                            onTap: () => (){},
                            child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Package Name", style: setStyleContent(context,PsColors.black,14,FontWeight.bold)),
                                    SizedBox(height: 5,),
                                    Text(widget.data.name, style: setStyleContent(context,PsColors.grey,12,FontWeight.normal)),

                                  ],
                                )
                            ),
                          ),
                          Divider(height: 0),
                          InkWell(
                            highlightColor: Colors.grey.withOpacity(0.1),
                            splashColor: Colors.grey.withOpacity(0.1),
                            onTap: () => (){},
                            child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Price", style: setStyleContent(context,PsColors.black,14,FontWeight.bold)),
                                    SizedBox(height: 5,),
                                    Text('NGN ${widget.data.price}', style: setStyleContent(context,PsColors.grey,12,FontWeight.normal)),

                                  ],
                                )
                            ),
                          ),
                          Divider(height: 0),
                          InkWell(
                            highlightColor: Colors.grey.withOpacity(0.1),
                            splashColor: Colors.grey.withOpacity(0.1),
                            onTap: () => (){},
                            child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Has Facebook Advert", style: setStyleContent(context,PsColors.black,14,FontWeight.bold)),
                                    Text(widget.data.facebookAdsDuration == "0"? 'No': 'Yes', style: setStyleContent(context,PsColors.grey,12,FontWeight.normal)),

                                  ],
                                )
                            ),
                          ),
                          Divider(height: 0),
                          InkWell(
                            highlightColor: Colors.grey.withOpacity(0.1),
                            splashColor: Colors.grey.withOpacity(0.1),
                            onTap: () => (){},
                            child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Refresh Duration", style: setStyleContent(context,PsColors.black,14,FontWeight.bold)),
                                    Text('${widget.data.minutesDuration} min(s)', style: setStyleContent(context,PsColors.grey,12,FontWeight.normal)),

                                  ],
                                )
                            ),
                          ),
                          Divider(height: 0),
                          InkWell(
                            highlightColor: Colors.grey.withOpacity(0.1),
                            splashColor: Colors.grey.withOpacity(0.1),
                            onTap: () => (){},
                            child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Description", style: setStyleContent(context,PsColors.black,15,FontWeight.bold)),
                                    Text('${widget.data.description}', style: setStyleContent(context,PsColors.grey,14,FontWeight.bold)),

                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 10),
                    Card(
                      margin: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(0),),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Category Picture Limits", style: setStyleContent(context,PsColors.mainColor,14,FontWeight.bold)),
                              ],
                            ),
                          ),
                          Container(height: 10),

                          ListView.builder(
                            shrinkWrap: true,
                            primary: false,

                            itemBuilder: (BuildContext context, int index) {
                              return PackageCategoryView(
                                data: widget.data.packagePermission[index],
                                onTap: () async {},
                              );
                            },
                            itemCount: widget.data.packagePermission.length,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      );
  }

  _walletConfirmation(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: PsColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                padding: EdgeInsets.symmetric(
                    vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text("Wallet Confirmation",
                        style: setStyleContent(context,PsColors.black,17,FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 4,),
                    Container(
                      child: Text("The sum of ${widget.data.price} will be deducted from your wallet",
                        style: setStyleContent(context,PsColors.black,14,FontWeight.normal),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: PlatformButton(
                                  onPressed: () async {
                                    print('sšs');
                                    await PsProgressDialog.showDialog(context);
                                    final DrResource<List<PackageModel>> _apiStatus =
                                    await _packagesProvider.requestData({"payment_type":"wallet","package_id":'1',"payment_amount":'3000'},psValueHolder.apiToken);
                                    if (_apiStatus.data != null) {
                                      Navigator.pop(context);
                                      context.showSuccessBar(content: Text(_apiStatus.message));
                                    } else {
                                      PsProgressDialog.dismissDialog();
                                      context.showErrorBar(content: Text(_apiStatus.message));

                                    }
                                  },
                                  child: Text('Continue'),
                                  material: (_, __)  => MaterialRaisedButtonData(
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                                      color: PsColors.mainColor,
                                      textColor: PsColors.white
                                  ),
                                  cupertino: (_, __) => CupertinoButtonData(
                                    color: PsColors.mainColor,
                                  )
                              )
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                              child: PlatformButton(
                                  onPressed: ()  {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                  material: (_, __)  => MaterialRaisedButtonData(
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
                                      color: PsColors.black,
                                      textColor: PsColors.white
                                  ),
                                  cupertino: (_, __) => CupertinoButtonData(
                                    color: PsColors.black,
                                  )
                              )
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  _selectPaymentMethod(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: PsColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                padding: EdgeInsets.symmetric(
                    vertical: 24, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text("Select Payment Method",
                        style: setStyleContent(context,PsColors.black,17,FontWeight.normal),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                _walletConfirmation(context);

                              },
                              child: Container(
                                child:Container(
                                  decoration: BoxDecoration(
                                      color: PsColors.mainColor,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: PsColors.mainColor,
                                          width: 1)),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(DrConfig.getImage('wallet.png'),height: 30,),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        child: Text(
                                          'Wallet',
                                          style: setStyleContent(context,PsColors.white
                                              ,14,FontWeight.normal),

                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _changePaymentMethod(2);
                                Navigator.pop(context);
                              },
                              child: Container(
                                child:Container(
                                  decoration: BoxDecoration(
                                      color: PsColors.mainDarkColor,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: PsColors.mainDarkColor,
                                          width: 1)),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(DrConfig.getImage('money_transfer.png'),height: 30,),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        child: Text(
                                          'Transfer',
                                          style: setStyleContent(context,PsColors.white
                                              ,14,FontWeight.normal),

                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                _changePaymentMethod(3);
                                //double amt = double.parse(widget.data.price.toString());
                                int amount = int.parse(widget.data.price);
                                Charge charge = Charge()
                                  ..amount = amount*100
                                  ..email = psValueHolder.email
                                  ..card = _getCardFromUI();
                                charge.reference = _getReference();

                                CheckoutResponse response = await plugin.checkout(context,method: _parseStringToMethod("Card"), charge: charge, fullscreen: true, logo: Image.asset(DrConfig.getImage('app_logo.png'),height: 50,width: 50,));
                                print('Response = $response');

                                if(response.message == "Success"){
                                  await PsProgressDialog.showDialog(context);
                                  final DrResource<List<PackageModel>> _apiStatus =
                                  await _packagesProvider.requestData({"payment_type":'paystack',"package_id":widget.data.id,"payment_amount":widget.data.price, "source":"PayStack", "status":"paid","payment_ref":response.reference},psValueHolder.apiToken);
                                  if (_apiStatus.data != null) {
                                    Navigator.pop(context);
                                    context.showSuccessBar(content: Text(_apiStatus.message));
                                  } else {
                                    PsProgressDialog.dismissDialog();
                                    context.showErrorBar(content: Text('Unable to process your request, Please try again',));

                                  }
                                }else{
                                  context.showErrorBar(content: Text(response.message));

                                }
                              },
                              child: Container(
                                child:Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF09A5DB),
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: Color(0xFF09A5DB),
                                          width: 1)),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset(DrConfig.getImage('paystack.png'),height: 30,),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        child: Text(
                                          'PayStack',
                                          style: setStyleContent(context,PsColors.white
                                              ,14,FontWeight.normal),

                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
