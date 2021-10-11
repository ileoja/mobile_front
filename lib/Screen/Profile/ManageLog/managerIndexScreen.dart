import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/manager_log/manager_log_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/manager_log_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Profile/ManageLog/addManagerLog.dart';
import 'package:ileoja/Screen/Widget/widgetManager.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class ManagerIndexScreen extends StatefulWidget {
  const ManagerIndexScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final bool data;
  @override
  _ManagerIndexScreenState createState() => _ManagerIndexScreenState();
}

class _ManagerIndexScreenState extends State<ManagerIndexScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  ManagerLogProvider _managerLogProvider;
  ManagerLogRepository _managerLogRepository;

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
    _managerLogRepository = Provider.of<ManagerLogRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        title: textStyle(context, "Manager Content Log", 18, PsColors.black),
        trailingActions: [
          PlatformIconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddManagerLogScreen()));
              //AddEmergencyScreen

            },
            materialIcon: Icon(Icons.add),
            cupertinoIcon: Icon(
              CupertinoIcons.add,
              size: 28.0,
            ),
          )
        ],
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
      body: RefreshIndicator(
        child: ChangeNotifierProvider<ManagerLogProvider>(
          lazy: false,
          create: (BuildContext context) {
            final ManagerLogProvider provider =
            ManagerLogProvider(repo: _managerLogRepository, psValueHolder: psValueHolder);
            provider.getLog(psValueHolder.apiToken);
            _managerLogProvider = provider;
            return _managerLogProvider;
          },
          child: Consumer<ManagerLogProvider>(builder: (
              BuildContext context,
              ManagerLogProvider paymentPackage,
              Widget child,
              ) {
            if (_managerLogProvider.dataList.data != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ManagerLogWidget(
                          data: _managerLogProvider.dataList.data[index],
                          onTap: () async {

                          },
                        );
                      },
                      itemCount: _managerLogProvider.dataList.data.length,
                    ),
                  ),
                  PSProgressIndicator(_managerLogProvider.dataList.status,context),

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

  voidReload(){
    if(mounted)
      if(widget.data){
        _managerLogProvider.getLog(psValueHolder.apiToken);
      }else{
        //_managerLogProvider.getLog(psValueHolder.apiToken);
      }
  }

  Future<Null> _refresh() async{
    _managerLogProvider.getLog(psValueHolder.apiToken);

  }
}
