import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/product_adv/product_by_cat_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/product_by_cat_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Product/productIndexScreen.dart';
import 'package:ileoja/Screen/Widget/treadingWidget.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/Holder/paramHolder.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';

class ProductListingIndex extends StatefulWidget {
  const ProductListingIndex({
    Key key,
    @required this.data,
  }) : super(key: key);

  final ParamsHolder data;

  @override
  _ProductListingIndexState createState() => _ProductListingIndexState();
}

class _ProductListingIndexState extends State<ProductListingIndex> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  ProductByCatProvider _productByCatProvider;
  ProductByCatRepository _productByCatRepository;

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
    _productByCatRepository = Provider.of<ProductByCatRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      body: ChangeNotifierProvider<ProductByCatProvider>(
        lazy: false,
        create: (BuildContext context) {
          final ProductByCatProvider provider =
          ProductByCatProvider(repo: _productByCatRepository, psValueHolder: psValueHolder);
          provider.getData(widget.data.paramOne,widget.data.paramTwo);
          _productByCatProvider = provider;
          return _productByCatProvider;
        },
        child: Consumer<ProductByCatProvider>(builder: (
            BuildContext context,
            ProductByCatProvider paymentPackage,
            Widget child,
            ) {
          if (_productByCatProvider.dataList.data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return MyListingProduct(
                        data: _productByCatProvider.dataList.data[index],
                        onTap: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreenIndex(),),);
                        },
                      );
                    },
                    itemCount: _productByCatProvider.dataList.data.length,
                  ),
                ),
                PSProgressIndicator(_productByCatProvider.dataList.status,context),

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
