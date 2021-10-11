import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class ShareScreen extends StatefulWidget {
  @override
  _ShareScreenState createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;

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
    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: Text('Invite Friends', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: PsColors.black, fontFamily: 'Montserrat'),),
        material: (_, __)  => MaterialAppBarData(
          centerTitle: false,
          elevation: 0.2,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(),
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: Container(
        margin: EdgeInsets.only(right: 5, left: 5,top: 10),
        padding: EdgeInsets.all(15),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/image/invite.png',height: 250,),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Text('Earn 10% on the subscription of every friend invited for the first 12 months',style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
            textAlign: TextAlign.center,),
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            Container(
              padding: EdgeInsets.all(14),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(child:  Container(
                    child: Text('${DrConfig.dr_app_url_auth}/${psValueHolder.primaryKey}',
                      style:TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: PsColors.black, fontFamily: 'Montserrat'),
                    ),
                  ),),

                  Container(
                    child:  GestureDetector(
                      child: Image.asset('assets/image/share.png', height: 30,
                      ),
                      onTap: (){
                        Share.share('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
                            'minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat'
                            "For more information, Visit:https://ileoja.com.", subject: DrConfig.app_name);
                      },
                    ),
                  ),
                  Container(
                      child: GestureDetector(
                        child: Image.asset('assets/image/share2.png', height: 30,
                        ),
                        onTap: (){
                          Share.share('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
                              'minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                              'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat'
                              "For more information, Visit:https://ileoja.com.", subject: DrConfig.app_name);
                        },
                      )
                  )

                ],
              ),
              decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8),),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.01),
            Container(
              padding: EdgeInsets.all(14),
              height: 50,
              child: GestureDetector(
                child: Center(
                  child: Text('Invite from contact',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: PsColors.white, fontFamily: 'Montserrat')),)
              ),
              decoration:  BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.circular(8)),
            )
          ],
        ),
      ),
    );
  }
}
