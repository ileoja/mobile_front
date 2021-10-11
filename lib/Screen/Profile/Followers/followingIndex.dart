import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/FollowersModel.dart';
import 'package:ileoja/Provider/followers/followers_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/followers_respository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/widgetFollowing.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';
import 'package:flash/flash.dart';

class FollowersIndexScreen extends StatefulWidget {
  const FollowersIndexScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final String data;
  @override
  _FollowersIndexScreenState createState() => _FollowersIndexScreenState();
}

class _FollowersIndexScreenState extends State<FollowersIndexScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  FollowersProvider _followersProvider;
  FollowersRepository _followersRepository;

  @override
  void initState() {
    super.initState();
    //  voidReload();
  }

  @override
  void dispose() {
    super.dispose();
  }



  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    _followersRepository = Provider.of<FollowersRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
     // backgroundColor: PsColors.white,
      body: RefreshIndicator(
        child: ChangeNotifierProvider<FollowersProvider>(
          lazy: false,
          create: (BuildContext context) {
            final FollowersProvider provider =
            FollowersProvider(repo: _followersRepository, psValueHolder: psValueHolder);
            provider.getData(psValueHolder.apiToken,'type=${widget.data}');
            _followersProvider = provider;
            return _followersProvider;
          },
          child: Consumer<FollowersProvider>(builder: (
              BuildContext context,
              FollowersProvider paymentPackage,
              Widget child,
              ) {
            if (_followersProvider.dataList.data != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return FollowersWidget(
                          data: _followersProvider.dataList.data[index],
                          onTap: () async {
                            if (await Utils.checkInternetConnectivity()) {
                              final DrResource<List<FollowersModel>> _apiStatus = await _followersProvider.approvePostData(
                                {
                                  "id": _followersProvider.dataList.data[index].id,
                                },
                                psValueHolder.apiToken,
                              );
                              if (_apiStatus.data != null) {
                                context.showSuccessBar(content: Text('Request Accepted'));
                                _followersProvider.getData(psValueHolder.apiToken,'type=${widget.data}');

                              } else {
                                context.showErrorBar(content: Text(_apiStatus.message));
                                _followersProvider.getData(psValueHolder.apiToken,'type=${widget.data}');
                              }
                            } else {
                              context.showErrorBar(content: Text("Bad internet connection"));
                            }
                          },
                          onTap2: () async {
                            if (await Utils.checkInternetConnectivity()) {
                              final DrResource<List<FollowersModel>> _apiStatus = await _followersProvider.deletePostData(
                                {
                                  "id": _followersProvider.dataList.data[index].id,
                                },
                                psValueHolder.apiToken,
                              );
                              if (_apiStatus.data != null) {
                                context.showSuccessBar(content: Text('Request successful'));
                                _followersProvider.getData(psValueHolder.apiToken,'type=${widget.data}');

                              } else {
                                context.showErrorBar(content: Text(_apiStatus.message));
                                _followersProvider.getData(psValueHolder.apiToken,'type=${widget.data}');
                              }
                            } else {
                              context.showErrorBar(content: Text("Bad internet connection"));
                            }
                          },
                        );
                      },
                      itemCount: _followersProvider.dataList.data.length,
                    ),
                  ),
                  PSProgressIndicator(_followersProvider.dataList.status,context),

                ],
              );
            } else {
              return WidgetNoData();
            }
          }),
        ),
        onRefresh: _refresh,
      ),
    );
  }



  Future<Null> _refresh() async{
    _followersProvider.getData(psValueHolder.apiToken,'type=${widget.data}');

  }
}
