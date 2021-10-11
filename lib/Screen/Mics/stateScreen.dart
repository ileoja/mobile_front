
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/state/state_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/state_respository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/Screen/Widget/widgetState.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class StateScreen extends StatefulWidget {

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  StateProvider _stateProvider;
  StateRepository _stateRepository;

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
    _stateRepository = Provider.of<StateRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: textStyle(context, "Select State", 20, PsColors.black),
        leading: PlatformIconButton(
          padding: EdgeInsets.zero,
          icon: Icon(context.platformIcons.back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        material: (_, __) => MaterialAppBarData(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
      ),
      iosContentBottomPadding: true,
      iosContentPadding: true,

      body: ChangeNotifierProvider<StateProvider>(
        lazy: false,
        create: (BuildContext context) {
          final StateProvider provider = StateProvider(repo: _stateRepository);
          provider.getData();
          _stateProvider = provider;
          return _stateProvider;
        },
        child: Consumer<StateProvider>(builder: (
            BuildContext context,
            StateProvider paymentPackage,
            Widget child,
            ) {
          if (_stateProvider.dataList.data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return StateWidget(
                        data: _stateProvider.dataList.data[index],
                        onTap: () async {
                          Navigator.pop(context, _stateProvider.dataList.data[index]);
                        },
                      );
                    },
                    itemCount: _stateProvider.dataList.data.length,
                  ),
                ),
                PSProgressIndicator(_stateProvider.dataList.status,context),

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
