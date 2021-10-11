
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Model/WithdrawalModel.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Provider/withdrawal/withdrawal_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Reprository/withdrawal_repository.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MyBalanceIndex extends StatefulWidget {
  const MyBalanceIndex({
    Key key,
    @required this.data,
  }) : super(key: key);
  final UserModel data;
  @override
  _MyBalanceIndexState createState() => _MyBalanceIndexState();
}

class _MyBalanceIndexState extends State<MyBalanceIndex> {

  DrValueHolder psValueHolder;
  UserRepository userRepo;
  UserProvider userProvider;
  bool bindDataFirstTime = true;
  WithdrawalProvider withdrawalProvider;
  WithdrawalRepository withdrawalRepository;
  TextEditingController amount = new TextEditingController();


  @override
  void initState() {
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
    withdrawalRepository = Provider.of<WithdrawalRepository>(context);

    return MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<UserProvider>(
            lazy: false,
            create: (BuildContext context) {
              final UserProvider provider =
              UserProvider(repo: userRepo, psValueHolder: psValueHolder);
              provider.myProfile(Utils.checkUserLoginId(provider.psValueHolder),psValueHolder.apiToken);
              userProvider = provider;
              return userProvider;
            },
          ),
          ChangeNotifierProvider<WithdrawalProvider>(
            lazy: false,
            create: (BuildContext context) {
              final WithdrawalProvider provider =
              WithdrawalProvider(repo: withdrawalRepository, psValueHolder: psValueHolder);
              provider.getData(psValueHolder.apiToken);
              withdrawalProvider = provider;
              return withdrawalProvider;
            },
          ),

        ],
        child: PlatformScaffold(
          appBar: PlatformAppBar(
            title: Text('Withdrawal', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
              physics: ScrollPhysics(),
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
                          bindDataFirstTime = false;
                        }
                        return Container(
                            color: PsColors.white,
                            child: Column(
                              children: [
                                Container(
                                    color: Color(0xffF1F1F1),
                                    child:Column(
                                      children: [
                                        SizedBox(height: 30,),
                                        Container(
                                          child:Image.asset('assets/image/walletID.png', height: 50,),
                                        ),
                                        SizedBox(height: 11,),
                                        Text("₦ "+userProvider.user.data.walletAccount,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: PsColors.mainColor, fontFamily: 'Montserrat')),
                                        SizedBox(height: 5,),
                                        Text('Ileoja’s referral earning wallet balance', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat')),
                                        SizedBox(height: 15,),
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
                                                  child: Text("WITHDRAWAL",
                                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: PsColors.white, fontFamily: 'Montserrat'))),
                                            ),
                                            onTap: () async {
                                              showModalBottomSheet(
                                                  //enableDrag: true,
                                                  isDismissible: true,
                                                  isScrollControlled: true,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20.0),
                                                        topRight: Radius.circular(20.0),
                                                      )),
                                                  context: context,
                                                  builder: (BuildContext bc) {
                                                    return Padding(
                                                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                        child: Container(
                                                          margin: EdgeInsets.only(top: 6,left: 5,right: 5),
                                                          padding: EdgeInsets.all(15.0),
                                                          height: MediaQuery.of(context).size.height / 2 + MediaQuery.of(context).viewInsets.bottom,
                                                          decoration: BoxDecoration(
                                                            //color: PsColors.white,
                                                            borderRadius: BorderRadius.all(Radius.circular(13)),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Center(
                                                                child: Text('How much do you want to withdraw?',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
                                                              ),
                                                              SizedBox(height: 10,),
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                              hintText: 'Enter Amount',
                                                                              hintStyle: TextStyle(),
                                                                              labelText: 'Enter Amount',
                                                                              labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                                            ),
                                                                            controller: amount,
                                                                            keyboardType: TextInputType.number,
                                                                          ),
                                                                      cupertino: (_, __) =>
                                                                          CupertinoTextFieldData(
                                                                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                                                                            placeholder: 'Enter Amount',
                                                                            clearButtonMode: OverlayVisibilityMode.editing,
                                                                            keyboardType: TextInputType.number,
                                                                            autocorrect: false,
                                                                            controller: amount,
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
                                                                            child: Text("WITHDRAW NOW",
                                                                                style:TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: PsColors.white, fontFamily: 'Montserrat'))),
                                                                      ),
                                                                      onTap: () async {
                                                                        if (await Utils.checkInternetConnectivity()) {
                                                                          //await PsProgressDialog.showDialog(context);
                                                                          final DrResource<List<WithdrawalModel>> _apiStatus = await withdrawalProvider.withdrawalPostData(
                                                                            {
                                                                              "amount_withdrawn": amount.text,
                                                                            },
                                                                            psValueHolder.apiToken,
                                                                          );
                                                                          if (_apiStatus.data != null) {
                                                                           // PsProgressDialog.dismissDialog();
                                                                            context.showSuccessBar(content: Text(_apiStatus.message));
                                                                            Navigator.pop(context);

                                                                          } else {
                                                                            context.showErrorBar(content: Text(_apiStatus.message));
                                                                            //PsProgressDialog.dismissDialog();
                                                                          }
                                                                        } else {
                                                                          context.showErrorBar(content: Text("Bad internet connection"));
                                                                         // PsProgressDialog.dismissDialog();
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                    );
                                                  });
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                ),

                                Consumer<WithdrawalProvider>(builder: (
                                    BuildContext context,
                                    WithdrawalProvider paymentPackage,
                                    Widget child,
                                    ) {
                                  if (withdrawalProvider.dataList.data != null) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 6),
                                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("₦ ${withdrawalProvider.dataList.data[index].amountWithdrawn}",
                                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.mainColor, fontFamily: 'Montserrat')),
                                              SizedBox(height: 10,),
                                              Container(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text('Withdrawn', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: PsColors.black, fontFamily: 'Montserrat')),
                                                            SizedBox(width: 5,),
                                                            Container(
                                                              height: 13,
                                                              width: 2,
                                                              decoration: BoxDecoration(
                                                                color: PsColors.black
                                                                    .withOpacity(0.5),
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(4.0)),
                                                              ),
                                                            ),
                                                            SizedBox(width: 5,),
                                                            Text(DrConfig.dateFormatToString(withdrawalProvider.dataList.data[index].createdAt), style: TextStyle(fontWeight:FontWeight.w400, color: Colors.black, fontSize: 12, fontFamily: 'Montserrat')),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.all(5),
                                                        child: Center(
                                                          child: Text("${withdrawalProvider.dataList.data[index].status}",
                                                              style: setStyleContent(context,withdrawalProvider.dataList.data[index].status == "Pending"?PsColors.white:Colors.white,13,FontWeight.normal,)
                                                            ,),
                                                        ),
                                                        decoration: BoxDecoration(color: withdrawalProvider.dataList.data[index].status == "Pending"?PsColors.redColor:Colors.green, borderRadius: BorderRadius.circular(8)),
                                                      ),
                                                    ],
                                                  )
                                              ),
                                              Container(width: 10)
                                            ],
                                          ),
                                          decoration: BoxDecoration(border: Border.all(color: Color(0xffE9E9E9)), borderRadius: BorderRadius.circular(8)),
                                        );
                                      },
                                      itemCount: withdrawalProvider.dataList.data.length,
                                    );
                                  } else {
                                    return WidgetNoData();
                                  }
                                }),
                              ],
                            )
                        );
                      }else{
                        return PSProgressIndicator(userProvider.user.status,context);
                      }
                    }),
              )),
        )
    );

  }
}
