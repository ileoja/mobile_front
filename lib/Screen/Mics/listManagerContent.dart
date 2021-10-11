import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/manager_content/manager_content_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/manager_content_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class ListManagerScreen extends StatefulWidget {
  const ListManagerScreen({
    Key key,
  }) : super(key: key);
  @override
  _ListManagerScreenState createState() => _ListManagerScreenState();
}

class _ListManagerScreenState extends State<ListManagerScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  ManagerContentProvider _managerContentProvider;
  ManagerContentRepository _managerContentRepository;

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
    _managerContentRepository = Provider.of<ManagerContentRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: textStyle(context, "Log Content", 18, PsColors.black),
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
      body: ChangeNotifierProvider<ManagerContentProvider>(
        lazy: false,
        create: (BuildContext context) {
          final ManagerContentProvider provider =
          ManagerContentProvider(repo: _managerContentRepository, psValueHolder: psValueHolder);
          provider.getManagerContent(psValueHolder.apiToken);
          _managerContentProvider = provider;
          return _managerContentProvider;
        },
        child: Consumer<ManagerContentProvider>(builder: (
            BuildContext context,
            ManagerContentProvider paymentPackage,
            Widget child,
            ) {
          if (_managerContentProvider.dataList.data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: Container(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(_managerContentProvider.dataList.data[index].subject,
                                  style: setStyleContent(context,PsColors.black,16,FontWeight.normal)
                              ),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 10,right: 10),
                        ),
                        onTap: (){
                          Navigator.pop(context, _managerContentProvider.dataList.data[index]);
                        },
                      );
                    },
                    itemCount: _managerContentProvider.dataList.data.length,
                  ),
                ),
                PSProgressIndicator(_managerContentProvider.dataList.status,context),

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
