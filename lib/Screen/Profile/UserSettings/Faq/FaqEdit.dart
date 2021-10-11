import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';

class FaqEditIndex extends StatefulWidget{
  @override
  FaqEditIndexState createState() => FaqEditIndexState();
}
class FaqEditIndexState extends State <FaqEditIndex>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: Text('Faq', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18,
            color: PsColors.black, fontFamily: 'Montserrat'),),
        material:  (_, __)  => MaterialAppBarData(
          centerTitle: false,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        cupertino:  (_, __) => CupertinoNavigationBarData(),
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: Container(
        margin: EdgeInsets.only(top: 5, right: 5, left: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/login_view.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Row(
                  children: <Widget>[
                    Text("Posting Ads",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                        color: PsColors.black, fontFamily: 'Montserrat'),),
                    Spacer(),
                    Icon(Icons.add, color: Colors.grey.shade700,size: 18,),
                    Container(width: 10)
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Divider(height: 5),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Row(
                  children: <Widget>[
                    Text("Managing Ads", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                        color: PsColors.black, fontFamily: 'Montserrat'),),
                    Spacer(),
                    Icon(Icons.add, color: Colors.grey.shade700,size: 18,),
                    Container(width: 10)
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Divider(height: 5),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Row(
                  children: <Widget>[
                    Text("How to leave feedbacks",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                        color: PsColors.black, fontFamily: 'Montserrat'),),
                    Spacer(),
                    Icon(Icons.add, color: Colors.grey.shade700,size: 18,),
                    Container(width: 10)
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Divider(height: 5),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Row(
                  children: <Widget>[
                    Text("Notifications",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16,
                        color: PsColors.black, fontFamily: 'Montserrat'),),
                    Spacer(),
                    Icon(Icons.add, color: Colors.grey.shade700,size: 18,),
                    Container(width: 10)
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Divider(height: 5),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                child: Row(
                  children: <Widget>[
                    Text("How to buy",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15,
                        color: PsColors.black, fontFamily: 'Montserrat'),),
                    Spacer(),
                    Icon(Icons.add, color: Colors.grey.shade700,size: 18,),
                    Container(width: 10)
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


