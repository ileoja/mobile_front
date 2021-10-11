import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/packages/packages_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/packages_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Order/orderSuccess.dart';
import 'package:ileoja/Screen/Profile/Packages/packageDetailsScreen.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/Screen/Widget/widgetPackage.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class PackageIndexScreen extends StatefulWidget {
  const PackageIndexScreen({
    Key key,
  }) : super(key: key);

  @override
  _PackageIndexScreenState createState() => _PackageIndexScreenState();
}

class _PackageIndexScreenState extends State<PackageIndexScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  PackagesProvider _packagesProvider;
  PackagesRepository _packagesRepository;

  @override
  void initState() {
    super.initState();

  }


  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    _packagesRepository = Provider.of<PackagesRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: Text('Get More Sales', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat')),
        material: (_, __)  => MaterialAppBarData(
          centerTitle: false,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(),
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body:  Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 5, right: 5, left: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/login_view.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(height: 5),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/image/propertyg.png',height: 50,),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(child: Text('Property', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),),),
                              Container(child: Text('Click for more details', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.grey),),),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Center(child: Text('premium', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 12),),),
                          decoration: BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),)
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(color: PsColors.mainColor), borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Divider(height: 5),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/image/Carsg.png',height: 27,),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(child: Text('Cars', style:TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),)),
                              Container(child: Text('Click for more details', style:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.grey),),),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Center(child: Text('premium', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 12),),),
                          decoration: BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),)
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(color: PsColors.mainColor,), boxShadow: [ BoxShadow(color: Colors.white, spreadRadius: 5, blurRadius: 7,
                  offset: Offset(0, 3),)],borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Divider(height: 5),
            InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/image/othersg.png',height: 50,),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(child: Text('Others', style:TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Montserrat', color: PsColors.black),)),
                              Container(child: Text('Click for more details', style:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Montserrat', color: PsColors.grey),),),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Center(child: Text('premium', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 12),),),
                          decoration: BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),)
                  ],
                ),
                decoration: BoxDecoration(border: Border.all(color: PsColors.mainColor), borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Text('Do you know that you can increase your sales on ileoja to earn more?',
                        textAlign: TextAlign.center,style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'Montserrat', fontWeight: FontWeight.w400))),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Container(
              padding: EdgeInsets.all(14),
              height: 50,
              child: GestureDetector(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('SEE HOW IT WORKS',  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: PsColors.white, fontFamily: 'Montserrat')),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSuccess(),),);
                  }
              ),

              decoration:  BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ),
    );
  }
}
