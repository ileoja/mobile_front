import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class LeaveFeedBack extends StatefulWidget{
  @override
  LeaveFeedBackState createState() => LeaveFeedBackState();
}

class LeaveFeedBackState extends State <LeaveFeedBack>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(
      backgroundColor: Colors.white,
      appBar: PlatformAppBar(
        title: Text('Leave feedback', style: TextStyle(fontFamily: 'Montserrat', fontSize: 18, color: PsColors.black, fontWeight: FontWeight.w500),),
          material: (_, __) => MaterialAppBarData(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        automaticallyImplyLeading: true,
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: Container(
        margin: EdgeInsets.only(right: 5, left: 5,top: 10),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child:  Container(
                        width: double.infinity, height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/image/smile.png', height: 18, width: 21.57,),
                          Text('Happy', style: TextStyle(fontFamily: 'Montserrat', fontSize: 12, color: PsColors.black, fontWeight: FontWeight.normal),)

                        ],
                      ),
                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                    ) ),
                SizedBox(width: 10),
                Expanded(
                    child:  Container(
                        width: double.infinity, height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/image/neutral.png', height: 18, width: 21.57,),
                            Text('Neutral', style: TextStyle(fontFamily: 'Montserrat', fontSize: 12, color: PsColors.black, fontWeight: FontWeight.normal),)

                          ],
                        ),
                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                    ) ),
                SizedBox(width: 10),
                Expanded(
                    child:  Container(
                        width: double.infinity, height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/image/sad.png', height: 18, width: 21.57,),
                            Text('Sad', style: TextStyle(fontFamily: 'Montserrat', fontSize: 12, color: PsColors.black, fontWeight: FontWeight.normal),)

                          ],
                        ),
                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                    ) ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.07),
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
                  hintText: 'Subject',
                  hintStyle: TextStyle(),
                  labelText: 'Subject',
                  labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                ),
                // controller: _confirmNewPassword,
                keyboardType: TextInputType.text,
              ),
              cupertino: (_, __) => CupertinoTextFieldData(
                placeholder: 'Subject',
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
                  hintText: 'Write a detailed feedback',
                  hintStyle: TextStyle(),
                  labelText: 'Write a detailed feedback',
                  labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
                ),
                // controller: _confirmNewPassword,
                keyboardType: TextInputType.text,
              ),
              cupertino: (_, __) => CupertinoTextFieldData(
                placeholder: 'Write a detailed feedback',
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
            Container(
              padding: EdgeInsets.all(14),
              height: 50,
              child: GestureDetector(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('SEND FEEDBACK',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: PsColors.white, fontFamily: 'Montserrat')),)
              ),
              decoration:  BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(8)),
            )
          ],
        ),
      ),
    );
  }
}