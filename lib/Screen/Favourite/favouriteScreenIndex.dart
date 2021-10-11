
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/favorite/favorite_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/favorite_respository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/treadingWidget.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class FavouriteScreenIndex extends StatefulWidget {
  const FavouriteScreenIndex({
    Key key,
  }) : super(key: key);

  @override
  _FavouriteScreenIndexState createState() => _FavouriteScreenIndexState();
}

class _FavouriteScreenIndexState extends State<FavouriteScreenIndex> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  FavoriteProvider _favoriteProvider;
  FavoriteRepository _favoriteRepository;

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
    _favoriteRepository = Provider.of<FavoriteRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: false,
        title: textStyle(context, "Favourite", 18, PsColors.black),
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
      body: ChangeNotifierProvider<FavoriteProvider>(
        lazy: false,
        create: (BuildContext context) {
          final FavoriteProvider provider =
          FavoriteProvider(repo: _favoriteRepository, psValueHolder: psValueHolder);
          provider.getData(psValueHolder.apiToken);
          _favoriteProvider = provider;
          return _favoriteProvider;
        },
        child: Consumer<FavoriteProvider>(builder: (
            BuildContext context,
            FavoriteProvider paymentPackage,
            Widget child,
            ) {
          if (_favoriteProvider.dataList.data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return FavouriteWidget(
                        data: _favoriteProvider.dataList.data[index],
                        onTap: () async {},
                      );
                    },
                    itemCount: _favoriteProvider.dataList.data.length,
                  ),
                ),
                PSProgressIndicator(_favoriteProvider.dataList.status,context),

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
