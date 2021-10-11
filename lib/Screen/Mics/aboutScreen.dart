import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';


class AboutApplication extends StatefulWidget {

  AboutApplication();

  @override
  AboutApplicationState createState() => new AboutApplicationState();
}


class AboutApplicationState extends State<AboutApplication> {

  @override
  Widget build(BuildContext context) {
    return new PlatformScaffold(
      backgroundColor: PsColors.mainColor,
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: textStyle(context, "About", 18, PsColors.white),
        backgroundColor: PsColors.mainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {Navigator.pop(context);},
        ),
        material: (_, __)  => MaterialAppBarData(
          centerTitle: false,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        cupertino: (_, __) => CupertinoNavigationBarData(),
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(DrConfig.app_name, style: setStyleContent(context,PsColors.white,22,FontWeight.normal),),
            Container(height: 5),
            Container(width: 50, height: 3, color: Colors.white),
            Container(height: 15),
            Text("Version", style: setStyleContent(context,Colors.grey.shade300,16,FontWeight.normal),),
            Text(DrConfig.app_version, style: setStyleContent(context,Colors.white,18,FontWeight.bold)),
            Container(height: 25),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', textAlign: TextAlign.justify, style: setStyleContent(context,PsColors.white,16,FontWeight.normal),),
            Container(height: 25),
          ],
        ),
      ),
    );
  }
}

