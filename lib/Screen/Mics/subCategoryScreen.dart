import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/sub_category/sub_category_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/sub_category_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class SellSubCategoryScreen extends StatefulWidget {
  const SellSubCategoryScreen({
    Key key,
    @required this.data,
  }) : super(key: key);
  final String data;
  @override
  _SubCategoryIndexState createState() => _SubCategoryIndexState();
}

class _SubCategoryIndexState extends State<SellSubCategoryScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  SubCategoryProvider _subCategoryProvider;
  SubCategoryRepository _subCategoryRepository;

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
    _subCategoryRepository = Provider.of<SubCategoryRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
        appBar: PlatformAppBar(
          automaticallyImplyLeading: true,
          title: textStyle(context, "Category", 18, PsColors.black),
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
        body: ChangeNotifierProvider<SubCategoryProvider>(
          lazy: false,
          create: (BuildContext context) {
            final SubCategoryProvider provider =
            SubCategoryProvider(repo: _subCategoryRepository, psValueHolder: psValueHolder);
            provider.getData(widget.data);
            _subCategoryProvider = provider;
            return _subCategoryProvider;
          },
          child: Consumer<SubCategoryProvider>(builder: (
              BuildContext context,
              SubCategoryProvider paymentPackage,
              Widget child,
              ) {
            if (_subCategoryProvider.dataList.data != null) {
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
                                child: Text(_subCategoryProvider.dataList.data[index].subCatName,
                                    style: setStyleContent(context,PsColors.black,16,FontWeight.normal)
                                ),
                              ),
                            ),
                            padding: EdgeInsets.only(left: 10,right: 10),
                          ),
                          onTap: (){
                            Navigator.pop(context, _subCategoryProvider.dataList.data[index]);
                          },
                        );
                      },
                      itemCount: _subCategoryProvider.dataList.data.length,
                    ),
                  ),
                  PSProgressIndicator(_subCategoryProvider.dataList.status,context),

                ],
              );
            } else {
              return WidgetNoData();
            }
          }),
        )
    );

  }



}
