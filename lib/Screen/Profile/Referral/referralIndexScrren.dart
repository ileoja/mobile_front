import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/packages/packages_provider.dart';
import 'package:ileoja/Provider/referral/referral_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/favorite_repository.dart';
import 'package:ileoja/Reprository/packages_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Profile/Packages/packageDetailsScreen.dart';
import 'package:ileoja/Screen/Widget/referralWidget.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/Screen/Widget/widgetPackage.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class ReferralIndexScreen extends StatefulWidget {
  const ReferralIndexScreen({
    Key key,
  }) : super(key: key);

  @override
  _ReferralIndexScreenState createState() => _ReferralIndexScreenState();
}

class _ReferralIndexScreenState extends State<ReferralIndexScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  ReferralProvider referralProvider;
  ReferralRepository referralRepository;

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
    referralRepository = Provider.of<ReferralRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: Text('My Referral', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
      body: ChangeNotifierProvider<ReferralProvider>(
        lazy: false,
        create: (BuildContext context) {
          final ReferralProvider provider =
          ReferralProvider(repo: referralRepository, psValueHolder: psValueHolder);
          provider.getData(psValueHolder.apiToken);
          referralProvider = provider;
          return referralProvider;
        },
        child: Consumer<ReferralProvider>(builder: (
            BuildContext context,
            ReferralProvider paymentPackage,
            Widget child,
            ) {
          if (referralProvider.dataList.data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ReferralWidget(
                        data: referralProvider.dataList.data[index],
                      );
                    },
                    itemCount: referralProvider.dataList.data.length,
                  ),
                ),
                PSProgressIndicator(referralProvider.dataList.status,context),

              ],
            );
          } else {
            return WidgetNoData();
          }
        }),
      ),
    );
  }
}
