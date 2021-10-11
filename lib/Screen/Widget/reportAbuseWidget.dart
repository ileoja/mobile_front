import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class ReportAbuse extends StatefulWidget{
  @override
  ReportAbuseState createState() => ReportAbuseState();
}
class ReportAbuseState extends State <ReportAbuse>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(
      backgroundColor: Colors.white,
      appBar: PlatformAppBar(
        title: Text('Report abuse', style: TextStyle(fontWeight: FontWeight.w500, color: PsColors.black, fontSize: 18, fontFamily: 'Montserrat'),),
        material: (_, __) => MaterialAppBarData(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        ),
        automaticallyImplyLeading: true,
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: Container(
        margin: EdgeInsets.only(right: 5, left: 5,top: 10),
        padding: EdgeInsets.all(15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset('assets/image/carssss.png',height: 100,),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Toyota Camry 2021',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
              ),
            SizedBox(height: 10),
            PlatformTextField(
              material: (_, __) => MaterialTextFieldData(
                cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                style: setStyleContent(context, Color(0xff666666), 12, FontWeight.normal),
                decoration:  InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: PsColors.mainColor, width: 1.0)),
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Choose Report Reason',
                  hintStyle: TextStyle(),
                  labelText: 'Choose Report Reason',
                  labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.black, fontFamily: 'Montserrat'),
                ),
                // controller: _confirmNewPassword,
                keyboardType: TextInputType.text,
              ),
              cupertino: (_, __) => CupertinoTextFieldData(
                placeholder: 'Choose Report Reason',
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
            SizedBox(height: 10),
            PlatformTextField(
              material: (_, __) => MaterialTextFieldData(
                cursorColor: Color.fromRGBO(0, 0, 0, 0.3),
                style: setStyleContent(context, Color(0xff666666), 12, FontWeight.normal),
                decoration:  InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 0.5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: PsColors.mainColor, width: 1.0)),
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Describe your issue',
                  hintStyle: TextStyle(),
                  labelText: 'Describe your issue',
                  labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                ),
                // controller: _confirmNewPassword,
                keyboardType: TextInputType.text,
              ),
              cupertino: (_, __) => CupertinoTextFieldData(
                placeholder: 'Describe your issue',
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
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Container(
              padding: EdgeInsets.all(14),
              height: 50,
              child: GestureDetector(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('SEND REPORT',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: PsColors.white, fontFamily: 'Montserrat')),)
              ),
              decoration:  BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(8)),
            )
          ],
        ),
      ),
    );
  }
}