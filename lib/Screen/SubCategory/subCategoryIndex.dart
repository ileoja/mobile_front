import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/sub_category/sub_category_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/sub_category_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Product/productListingIndex.dart';
import 'package:ileoja/Screen/Widget/subCategoryWidget.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/Holder/paramHolder.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class SubCategoryIndex extends StatefulWidget {
  const SubCategoryIndex({
    Key key,
    @required this.data,
  }) : super(key: key);
  final String data;
  @override
  _SubCategoryIndexState createState() => _SubCategoryIndexState();
}

class _SubCategoryIndexState extends State<SubCategoryIndex> {

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
      material: (_, __)=> MaterialScaffoldData(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return <Widget>[
                silverAppBar()
              ];
            },
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
                            return SubCategoryWidget(
                              data: _subCategoryProvider.dataList.data[index],
                              onTap: () async {
                                //
                                ParamsHolder p = new ParamsHolder(paramOne: widget.data,paramTwo:_subCategoryProvider.dataList.data[index].id);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListingIndex(data: p,),),);

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
            ),
        ),
      ),
    );

  }

  SliverAppBar silverAppBar() {
    return SliverAppBar(
      // expandedHeight: 200,
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
