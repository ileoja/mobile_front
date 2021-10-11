import 'package:flutter/material.dart' show Colors, Icons, ScaffoldState;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Favourite/favouriteScreenIndex.dart';
import 'package:ileoja/Screen/HomeScreen/homeScreenIndex.dart';
import 'package:ileoja/Screen/LoginAuth/authBottom.dart';
import 'package:ileoja/Screen/Profile/ProfileIndexScreen.dart';
import 'package:ileoja/Screen/Widget/messageWidget.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:provider/provider.dart';


class RootBottom extends StatefulWidget {
  _RootBottomStates createState() => _RootBottomStates();
}

class _RootBottomStates extends State<RootBottom> with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  final GlobalKey<ScaffoldState> _rootScaffoldKey = new GlobalKey<ScaffoldState>();
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    psValueHolder = Provider.of<DrValueHolder>(context);
    return PlatformScaffold(
      key: _rootScaffoldKey,
      iosContentPadding: true,
      iosContentBottomPadding: true,
      bottomNavBar: PlatformNavBar(
        currentIndex: _selectedTabIndex,
        itemChanged: (index) => setState(
              () {
            _selectedTabIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: PlatformWidget(
              cupertino: (_, __) => Image.asset('assets/image/home.png',height: 20,),
              material: (_, __) => Image.asset('assets/image/home.png',height: 20,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favourite',
            icon: PlatformWidget(
              cupertino: (_, __) => Image.asset('assets/image/favourite.png',height: 20,),
              material: (_, __) => Image.asset('assets/image/favourite.png',height: 20,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Sell',
            icon: PlatformWidget(
              cupertino: (_, __) => Image.asset('assets/image/sell.png',height: 20,),
              material: (_, __) => Image.asset('assets/image/sell.png',height: 20,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: PlatformWidget(
              cupertino: (_, __) => Image.asset('assets/image/messages.png',height: 20,),
              material: (_, __) => Image.asset('assets/image/messages.png',height: 20,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: PlatformWidget(
              cupertino: (_, __) => Image.asset('assets/image/account.png',height: 20,),
              material: (_, __) => Image.asset('assets/image/account.png',height: 20,),
            ),
          ),
        ],
        material: (_, __)  => MaterialNavBarData(
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed ,
          unselectedFontSize: 10,
          selectedIconTheme: IconThemeData(color: PsColors.mainColor,),
          unselectedIconTheme: IconThemeData(color: PsColors.grey),
          selectedFontSize: 15,
          unselectedItemColor: PsColors.grey,
          selectedItemColor: PsColors.mainColor,
          selectedLabelStyle: setStyleContent(context,PsColors.mainColor,11,FontWeight.normal),
          unselectedLabelStyle: setStyleContent(context,PsColors.grey,11,FontWeight.normal),
        ),
        cupertino: (_, __) => CupertinoTabBarData(
          inactiveColor: PsColors.grey,
          activeColor: PsColors.mainColor,
        ),
      ),
      body: new Center(
        child: getWidget(psValueHolder),
      ),
    );
  }

  Widget getWidget(DrValueHolder psValueHolder) {
    switch (_selectedTabIndex) {
      case 0:
        return HomeScreenContainer(action: false,);
        break;
      case 1:
        return psValueHolder.apiToken == null? AuthBottom() : FavouriteScreenIndex();
        break;
      case 2:
        return Text('sss');
        break;
      case 3:
        return MessNotificationTab();
        break;
      case 4:
        return psValueHolder.apiToken == null? AuthBottom() : ProfileIndexScreen(action:false);
        break;
    }
  }
}