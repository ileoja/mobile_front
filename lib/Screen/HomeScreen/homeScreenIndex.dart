import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ileoja/Model/CategoryModel.dart';
import 'package:ileoja/Model/ProductModel.dart';
import 'package:ileoja/Provider/category/category_provider.dart';
import 'package:ileoja/Provider/product_adv/trending_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/category_repository.dart';
import 'package:ileoja/Reprository/trending_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Product/under5kStoreIndex.dart';
import 'package:ileoja/Screen/SubCategory/subCategoryIndex.dart';
import 'package:ileoja/Screen/Widget/treadingWidget.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HomeScreenContainer extends StatefulWidget {
  const HomeScreenContainer({
    Key key,
    this.action,
    this.productModel,
    this.categoryModel,
  }) : super(key: key);
  final bool action;
  final ProductModel productModel;
  final CategoryModel categoryModel;
  @override
  _HomeScreenContainerState createState() => _HomeScreenContainerState();
}

class _HomeScreenContainerState extends State<HomeScreenContainer> {
  CategoryProvider _categoryProvider;
  CategoryRepository _categoryRepository;
  TrendingProvider _trendingProvider;
  TrendingRepository _trendingRepository;
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  String locationName;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Position currentLocation;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor iOSpinLocationIcon;
  static LatLng _initialPosition;
  static LatLng _lastMapPosition = _initialPosition;

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> _placeMark = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (mounted)
      setState(() {
        currentLocation = position;
        _initialPosition = LatLng(position.latitude, position.longitude);
        locationName = _placeMark[0].name;
        print('${_placeMark[0].name}');
      });
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void setCustomMapPin() async {
    iOSpinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/image/pin.png');
  }

  Future<void> callBack() async {
    if(widget.action){
      //await _categoryProvider.loadResult(psValueHolder.apiToken);
      setState(() {});
    }else{
    }
  }

  @override
  void initState() {
    setCustomMapPin();
    _getUserLocation();
    callBack();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    psValueHolder = Provider.of<DrValueHolder>(context);
    _categoryRepository = Provider.of<CategoryRepository>(context);
    _trendingRepository = Provider.of<TrendingRepository>(context);
    SizeConfig().init(context);
    return MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider<CategoryProvider>(
            lazy: false,
            create: (BuildContext context) {
              final CategoryProvider provider = CategoryProvider(repo: _categoryRepository, psValueHolder: psValueHolder);
              provider.getData(psValueHolder.apiToken);
              _categoryProvider = provider;
              return _categoryProvider;
            },
          ),
          ChangeNotifierProvider<TrendingProvider>(
              lazy: false,
              create: (BuildContext context) {
                final TrendingProvider provider = TrendingProvider(repo: _trendingRepository, psValueHolder: psValueHolder);
                provider.getData();
                _trendingProvider = provider;
                return _trendingProvider;
              }),

        ],
        child: PlatformScaffold(
          material: (_, __)=> MaterialScaffoldData(
            body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
                  return <Widget>[
                    silverAppBar()
                  ];
                },
                body: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.only(right: 10,left: 10),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(width: double.infinity, height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset('assets/image/naira.png', height: 16, width: 16),
                                        Text("How to sell",  style: setStyleContent(context, PsColors.black, 16, FontWeight.w500),),
                                      ],
                                    ),
                                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Container(width: double.infinity, height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset('assets/image/shopping-basket 1.png', height: 16, width: 16),
                                        Text("How to buy",  style: setStyleContent(context, PsColors.black, 16, FontWeight.w500),),
                                      ],
                                    ),
                                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(height: 10),
                        Container(
                          padding: EdgeInsets.only(right: 10,left: 10),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset('assets/image/flame.png', height:
                                        16, width:
                                        16),
                                        Text("Hot Deals",  style: setStyleContent(context, PsColors.black, 16, FontWeight.w500),),
                                      ],
                                    ),
                                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                                ),
                              ),
                              SizedBox(width: 10),

                              Expanded(
                                child: GestureDetector(
                                  child: Container(width: double.infinity, height: 40,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset('assets/image/under5k.png', height:
                                          16, width:
                                          16),
                                          Text("Under 5k store", style: setStyleContent(context, PsColors.white, 16, FontWeight.w500),),
                                        ],
                                      ),
                                      decoration: BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.all(Radius.circular(5)))
                                  ),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Under5kStore(),),);
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          alignment: Alignment.centerLeft,
                          child:
                          Text('Categories', style: setStyleContent(context, PsColors.black, 20, FontWeight.normal),
                          ),
                        ),
                        Container(
                          //color: Colors.grey,
                          child: Consumer<CategoryProvider>(builder: (BuildContext context,
                              CategoryProvider categoryProvider, Widget child) {
                            return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio:1.0),
                              physics: ScrollPhysics(),
                              padding: EdgeInsets.only(left: 4,right: 4),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryIndex(data: categoryProvider.dataList.data[index].id),),);
                                    });
                                  },
                                  child: Container(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          //color: PsColors.white,
                                        ),
                                        margin: EdgeInsets.only(left: 4,right: 4),
                                        child: Card(
                                          elevation:  0.0,
                                          margin: EdgeInsets.all(5),
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20)
                                            ),

                                          ),
                                          color:Colors.white,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:[
                                              CachedNetworkImage(
                                                imageUrl: categoryProvider.dataList.data[index].picture,
                                                height: 50,
                                                width: 50,
                                                progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                    LoadingIndicator(indicatorType: Indicator.ballPulse, color: PsColors.mainColor,),
                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                              ),
                                              SizedBox(height: 3,),
                                              Text("${categoryProvider.dataList.data[index].catName}",
                                                style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                              },
                              itemCount: categoryProvider.dataList.data.length,
                            );
                          }),
                        ),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          alignment: Alignment.centerLeft,
                          child:
                          Text('Trending', style: setStyleContent(context, PsColors.black, 18, FontWeight.normal),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.all(10.0),
                          alignment: Alignment.centerLeft,
                          child: Consumer<TrendingProvider>(builder: (BuildContext context,
                              TrendingProvider treadingProvider, Widget child) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: treadingProvider.dataList.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return TreadingWidget(
                                  data: treadingProvider.dataList.data[index],
                                  onTap: () async {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Reward4WasteDetailsScreen(data: _productProvider.dataList.data[index],),
                                    //   ),
                                    // );
                                  },
                                );
                              },

                            );
                          }),
                        ),


                      ]

                  ),
                )
            ),
          ),
        ),
    );

  }

  SliverAppBar silverAppBar() {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      backgroundColor: PsColors.mainColor,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            //Image.asset(D.get('image_16.jpg'), fit: BoxFit.cover, width: double.infinity),
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 90),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Text("What are you looking for ?", style: setStyleContent(context, PsColors.white, 25, FontWeight.normal),
                      ),
                      ),
                      Image.asset("assets/image/search_akp.png", height: 80, width: 80,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
                  IconButton(icon: Icon(Icons.search, color: Colors.grey[600]), onPressed: (){
                    setState(() {});
                  }),
                  Expanded(
                    child: TextField(maxLines: 1,
                      enabled: false,
                      style: setStyleContent(context, Colors.grey[600], 18, FontWeight.normal),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Locations',
                        //hintStyle: TextStyle(fontSize: 16.0,  fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
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
