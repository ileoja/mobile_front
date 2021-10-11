import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';

class SpecialFB extends StatefulWidget{
  @override
  SpecialFBState createState() => SpecialFBState();
}

class SpecialFBState extends State <SpecialFB>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(
      backgroundColor: Colors.white,
      appBar: PlatformAppBar(
        title: Text('Top Ads', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 5, right: 5, left: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/login_view.png'),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 2,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Ad Name:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Toyotal Camry 2021', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Approval Status:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Approved', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: Colors.green),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Expire Date:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('30th July 2021', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('View:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('0', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 2,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Ad Name:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Toyotal Camry 2021', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Approval Status:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Approved', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: Colors.green),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Expire Date:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('30th July 2021', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('View:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('0', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 2,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Ad Name:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Toyotal Camry 2021', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Approval Status:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('Approved', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: Colors.green),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('Expire Date:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('30th July 2021', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:  Text('View:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text('0', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.black),),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
      ),);
  }}