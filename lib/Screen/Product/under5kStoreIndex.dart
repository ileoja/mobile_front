import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/product_adv/under5k_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/Under5k_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Product/productIndexScreen.dart';
import 'package:ileoja/Screen/Widget/treadingWidget.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class Under5kStore extends StatefulWidget {
  @override
  _Under5kStoreState createState() => _Under5kStoreState();
}

class _Under5kStoreState extends State<Under5kStore> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  Under5kProvider _under5kProvider;
  Under5kRepository _under5kRepository;

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
    _under5kRepository = Provider.of<Under5kRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            silverAppBar()
          ];
        },
        body: ChangeNotifierProvider<Under5kProvider>(
          lazy: false,
          create: (BuildContext context) {
            final Under5kProvider provider =
            Under5kProvider(repo: _under5kRepository, psValueHolder: psValueHolder);
            provider.getData();
            _under5kProvider = provider;
            return _under5kProvider;
          },
          child: Consumer<Under5kProvider>(builder: (
              BuildContext context,
              Under5kProvider paymentPackage,
              Widget child,
              ) {
            if (_under5kProvider.dataList.data != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return TreadingWidget(
                          data: _under5kProvider.dataList.data[index],
                          onTap: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreenIndex(),),);
                          },
                        );
                      },
                      itemCount: _under5kProvider.dataList.data.length,
                    ),
                  ),
                  PSProgressIndicator(_under5kProvider.dataList.status,context),

                ],
              );
            } else {
              return WidgetNoData();
            }
          }),
        ),
      ),
    );

  }

  SliverAppBar silverAppBar() {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: PsColors.mainColor,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(25),
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            alignment: Alignment.bottomCenter,
            constraints: BoxConstraints.expand(height: 80),
            child: InkWell(
              child: Card(
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(3),),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 1,
                child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back, color: Colors.grey[600]), onPressed: (){
                      Navigator.pop(context);
                    }),
                    Expanded(
                      child: TextField(maxLines: 1,
                        enabled: false,
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Locations',
                          hintStyle: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                    IconButton(icon: Icon(Icons.favorite, color: Colors.grey[600]), onPressed: (){
                      // Navigator.pop(context);
                    }),
                    IconButton(icon: Icon(Icons.filter_list_outlined, color: Colors.grey[600]), onPressed: (){
                      // Navigator.pop(context);
                    }),
                  ],
                ),
              ),
              onTap: (){

              },
            )
        ),
      ),
    );
  }

}
