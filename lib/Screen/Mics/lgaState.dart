
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/llga/lga_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/lga_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/Screen/Widget/widgetState.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class LGAScreen extends StatefulWidget {
  const LGAScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final String data;
  @override
  _LGAScreenState createState() => _LGAScreenState();
}

class _LGAScreenState extends State<LGAScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  LGAProvider _lgaProvider;
  LGARepository _lgaRepository;

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
    _lgaRepository = Provider.of<LGARepository>(context);
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

      body: ChangeNotifierProvider<LGAProvider>(
        lazy: false,
        create: (BuildContext context) {
          final LGAProvider provider =
          LGAProvider(repo: _lgaRepository, psValueHolder: null);
          provider.getData(widget.data);
          _lgaProvider = provider;
          return _lgaProvider;
        },
        child: Consumer<LGAProvider>(builder: (
            BuildContext context,
            LGAProvider paymentPackage,
            Widget child,
            ) {
          if (_lgaProvider.dataList.data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return LgaWidget(
                        data: _lgaProvider.dataList.data[index],
                        onTap: () async {
                          Navigator.pop(context, _lgaProvider.dataList.data[index]);
                        },
                      );
                    },
                    itemCount: _lgaProvider.dataList.data.length,
                  ),
                ),
                PSProgressIndicator(_lgaProvider.dataList.status,context),

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
