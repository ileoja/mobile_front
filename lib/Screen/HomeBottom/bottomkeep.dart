import 'package:flutter/material.dart' show Colors, Icons, ScaffoldState;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Favourite/favouriteScreenIndex.dart';
import 'package:ileoja/Screen/HomeScreen/homeScreenIndex.dart';
import 'package:ileoja/Screen/LoginAuth/authBottom.dart';
import 'package:ileoja/Screen/Profile/ProfileIndexScreen.dart';
import 'package:ileoja/Screen/Widget/messageWidget.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
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
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    psValueHolder = Provider.of<DrValueHolder>(context);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(psValueHolder),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens(DrValueHolder psValueHolder) {
    return [
      HomeScreenContainer(action: false,),
      psValueHolder.apiToken == null? AuthBottom() : FavouriteScreenIndex(),
      MessNotificationTab(),
      MessNotificationTab(),
      psValueHolder.apiToken == null? AuthBottom() : ProfileIndexScreen(action:false),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/image/home.png',height: 33,),
        title: ("Home"),
        activeColorPrimary: PsColors.mainColor,
        inactiveColorPrimary: PsColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/image/favourite.png',height: 20,),
        title: ("Favourite"),
        activeColorPrimary: PsColors.mainColor,
        inactiveColorPrimary: PsColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/image/sell.png',height: 20,),
        title: ("Sell"),
        activeColorPrimary: PsColors.mainColor,
        inactiveColorPrimary: PsColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/image/messages.png',height: 20,),
        title: ("Message"),
        activeColorPrimary: PsColors.mainColor,
        inactiveColorPrimary: PsColors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/image/account.png',height: 20,),
        title: ("Account"),
        activeColorPrimary: PsColors.mainColor,
        inactiveColorPrimary: PsColors.grey,
      ),
    ];

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