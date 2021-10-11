
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/my_advert/my_advert_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/my_advert_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/treadingWidget.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class AdvertScreenIndex extends StatefulWidget {
  const AdvertScreenIndex({
    Key key,
    @required this.data,
  }) : super(key: key);

  final String data;

  @override
  _AdvertScreenIndexState createState() => _AdvertScreenIndexState();
}

class _AdvertScreenIndexState extends State<AdvertScreenIndex> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  MyAdvertProvider _myAdvertProvider;
  MyAdvertRepository _myAdvertRepository;

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
    _myAdvertRepository = Provider.of<MyAdvertRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      body: ChangeNotifierProvider<MyAdvertProvider>(
        lazy: false,
        create: (BuildContext context) {
          final MyAdvertProvider provider =
          MyAdvertProvider(repo: _myAdvertRepository, psValueHolder: psValueHolder);
          provider.getAdvert(psValueHolder.apiToken, 'status=${widget.data}');
          _myAdvertProvider = provider;
          return _myAdvertProvider;
        },
        child: Consumer<MyAdvertProvider>(builder: (
            BuildContext context,
            MyAdvertProvider paymentPackage,
            Widget child,
            ) {
          if (_myAdvertProvider.dataList.data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return MyAdvertWidget(
                        data: _myAdvertProvider.dataList.data[index],
                        onTap: () async {},
                      );
                    },
                    itemCount: _myAdvertProvider.dataList.data.length,
                  ),
                ),
                PSProgressIndicator(_myAdvertProvider.dataList.status,context),

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
