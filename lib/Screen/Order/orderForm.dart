import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Screen/Order/orderSuccess.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class OrderForm extends StatefulWidget{
  @override
  OrderFormState createState() => OrderFormState();
}

class OrderFormState extends State <OrderForm>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Order Form', style: TextStyle(fontWeight: FontWeight.w500, color: PsColors.black, fontSize: 18, fontFamily: ''),),
        material: (_,__) => MaterialAppBarData(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: SingleChildScrollView(
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
                Card(
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            child: Image.asset('assets/image/carssss.png', height:SizeConfig.size96, width: 110, fit: BoxFit.fill,),
                          ),
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.all(11.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('Toyota Camry 2021', style: setStyleContent(context, PsColors.grey, 16, FontWeight.normal),maxLines: 2,) ,
                                    ),
                                    Container(
                                      child: Text('N5,000,000', style: setStyleContent(context, PsColors.mainColor, 16, FontWeight.normal),maxLines: 2,) ,
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
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
                    hintText: 'Name',
                    hintStyle: TextStyle(),
                    labelText: 'Name',
                    labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                  ),
                  // controller: _oldPassword,
                  keyboardType: TextInputType.text,
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'Name',
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
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(),
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                  ),
                  //controller: _newPassword,
                  keyboardType: TextInputType.text,
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'Phone Number',
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
                    hintText: 'Delivery Address',
                    hintStyle: TextStyle(),
                    labelText: 'Delivery Address',
                    labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                  ),
                  //controller: _newPassword,
                  keyboardType: TextInputType.text,
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'Delivery Address',
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
                    hintText: 'Payment On Delivery',
                    hintStyle: TextStyle(),
                    labelText: 'Payment On Delivery',
                    labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                  ),
                  // controller: _confirmNewPassword,
                  keyboardType: TextInputType.text,
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'Payment On Delivery',
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
                    hintText: 'Quantity',
                    hintStyle: TextStyle(),
                    labelText: 'Quantity',
                    labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                  ),
                  // controller: _confirmNewPassword,
                  keyboardType: TextInputType.text,
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'Quantity',
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

        SizedBox(height: SizeConfig.screenHeight * 0.02),
        Align(
          alignment: Alignment.center,
          child: Text('By proceeding you agree to our',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.00),
        Align(
          alignment: Alignment.center,
          child: Text('Terms and Conditions',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.mainColor, fontFamily: 'Montserrat')),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        Container(
          padding: EdgeInsets.all(14),
          height: 50,
          child: GestureDetector(
              child: Align(
                alignment: Alignment.center,
                child: Text('ORDER',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: PsColors.white, fontFamily: 'Montserrat')),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSuccess(),),);
              }
          ),

          decoration:  BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(8)),
        ),
    ]))]))));
  }
}