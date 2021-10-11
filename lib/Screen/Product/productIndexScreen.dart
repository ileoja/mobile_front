
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Provider/category/category_provider.dart';
import 'package:ileoja/Provider/product_adv/trending_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/category_repository.dart';
import 'package:ileoja/Reprository/trending_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Widget/leaveFeedbackWidget.dart';
import 'package:ileoja/Screen/Widget/reportAbuseWidget.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProductScreenIndex extends StatefulWidget {

  @override
  _ProductScreenIndexState createState() => _ProductScreenIndexState();
}

class _ProductScreenIndexState extends State<ProductScreenIndex> {
  CategoryProvider _categoryProvider;
  CategoryRepository _categoryRepository;
  TrendingProvider _trendingProvider;
  TrendingRepository _trendingRepository;
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  int _current = 0;

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
    userProvider = UserProvider(repo: userRepository, psValueHolder: psValueHolder);
    psValueHolder = Provider.of<DrValueHolder>(context);
    _categoryRepository = Provider.of<CategoryRepository>(context);
    _trendingRepository = Provider.of<TrendingRepository>(context);
    Size size = MediaQuery.of(context).size;
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
          appBar: PlatformAppBar(
            title: textStyle(context, "Car  ", 20, PsColors.black),
            material: (_, __) => MaterialAppBarData(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              //automaticallyImplyLeading: true,
            ),
            automaticallyImplyLeading: true,
          ),
        iosContentBottomPadding: true,
        iosContentPadding: true,
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 0, bottom: 10),
                      child: SizedBox(
                        height: 200.0,
                        child: Carousel(
                          images: [
                            NetworkImage('https://repository-images.githubusercontent.com/289391177/ff1fef00-e8bc-11ea-8225-f4be5727dbf9'),
                            NetworkImage('https://repository-images.githubusercontent.com/289391177/ff1fef00-e8bc-11ea-8225-f4be5727dbf9'),
                          ],
                          showIndicator: true,
                          borderRadius: false,
                          noRadiusForIndicator: true,
                          overlayShadowColors: Colors.transparent,

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        right: 15,
                        left: 15,
                      ),
                      child:Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          width: 100,
                          height: 20,
                          padding: EdgeInsets.symmetric(horizontal: 30.0 / 2),
                          decoration: BoxDecoration(
                            color:PsColors.mainColor,
                            borderRadius: BorderRadius.circular(4),),
                          child: Center(
                            child: Text('Top ads',style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14, fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Container(
                    margin: EdgeInsets.only(right: 5, left: 5),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            // SizedBox(width: 9),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Toyota Camry 2021",
                                       style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 17,
                                           fontWeight: FontWeight.w400)
                                      ),

                                      Text(
                                          "NGN 773,2093",
                                          style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 20,
                                              fontWeight: FontWeight.w500)
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(Icons.location_on,size: 20,color: PsColors.mainColor,),
                                                  SizedBox(width: 10,),
                                                  Text("Lagos, Nigeria",
                                                      style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 12,
                                                          fontWeight: FontWeight.w400)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 80,),
                                            Container(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Chat Seller', style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 12,
                                                      fontWeight: FontWeight.normal)),
                                                  Image.asset('assets/image/sellers.png', height: 18, width: 21.57,  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5))),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(Icons.call,size: 20,color: PsColors.mainColor,),
                                                  SizedBox(width: 10,),
                                                  Text("08103141424",
                                                      style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 12,
                                                          fontWeight: FontWeight.w400)
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 80,),
                                            Container(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset('assets/image/ordenw.png', height: 18, width: 22.57,  ),
                                                  Text('Order Now', style: TextStyle(fontFamily: 'Montserrat', color: PsColors.white, fontSize: 12,
                                                      fontWeight: FontWeight.normal))
                                                ],
                                              ),
                                              decoration: BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(height: 15,),
                                            Icon(
                                              Icons.info_sharp,size: 20,color: PsColors.mainColor,
                                            ),
                                            SizedBox(width: 10,),
                                            RichText(
                                              text: TextSpan(
                                                  text: 'Market Value: ',
                                                  style: setStyleContent(context,PsColors.black,14,FontWeight.normal),
                                                  children: <TextSpan>[
                                                    TextSpan(text: '19898333',
                                                      style: setStyleContent(context,PsColors.black,13,FontWeight.normal),
                                                    )
                                                  ]
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),),
                                  SizedBox(height: 9,),
                                  Container(
                                    padding: EdgeInsets.only(right: 10,left: 10),
                                    color: Colors.grey.shade200,
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(width: double.infinity, height: 40,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Image.asset('assets/image/whatsAp.png', height: 16, width: 16),
                                                  Text("Whatsapp", style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 15,
                                                      fontWeight: FontWeight.normal),),
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
                                                  Image.asset('assets/image/call.png', height: 16, width: 16),
                                                  Text("Call", style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 15,
                                                      fontWeight: FontWeight.normal),),
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
                                                  Image.asset('assets/image/message.png', height: 16, width: 16),
                                                  Text("Message",style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 15,
                                                      fontWeight: FontWeight.normal),),
                                                ],
                                              ),
                                              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 9,),
                                  Container(
                                    //margin: EdgeInsets.only(right: 5, left: 5),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    color: Colors.grey.shade200,
                                    child:  Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("MAKE",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "MODEL",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        //
                                        SizedBox(height: 9,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("MAKE",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "MODEL",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),

                                        SizedBox(height: 9,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("MAKE",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "MODEL",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),

                                        SizedBox(height: 9,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("MAKE",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "MODEL",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),

                                        SizedBox(height: 9,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("MAKE",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "MODEL",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),

                                        SizedBox(height: 9,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "TEST",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("MAKE",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            ),

                                            Text(
                                              "MODEL",
                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 13,
                                                  fontWeight: FontWeight.normal),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 9,),
                                  Container(
                                    //margin: EdgeInsets.only(right: 5, left: 5),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    color: Colors.grey.shade200,
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Description',
                                          style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 9,),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text('Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione',style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 15,
                                                  fontWeight: FontWeight.normal),),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ),

                                  SizedBox(height: 9,),
                                  Container(
                                    //margin: EdgeInsets.only(right: 5, left: 5),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      color: Colors.grey.shade200,
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Store Address',
                                            style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 9,),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text('8, Irewole Street,Ikeja,Lagos',style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 15,
                                                    fontWeight: FontWeight.normal),),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                  ),
                                  SizedBox(height: 9,),
                                  AppButton(
                                    color: Colors.white,
                                    elevation: 0,
                                    width: context.width(),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text("Request seller to callback", style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    shapeBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                      side: BorderSide(color: PsColors.mainColor),
                                    ),
                                    onTap: () {},
                                  ),

                                  SizedBox(height: 9,),
                                  Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 3)
                                    ], color: Colors.white, borderRadius: BorderRadius.circular(3)),
                                    margin: EdgeInsets.only(right: 5, left: 5),
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 51,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(9.0),
                                            child: Image.network(
                                              "https://wallpaperaccess.com/full/2213424.jpg"
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Testing one and two",
                                                  style: Theme.of(context).textTheme.subtitle),

                                              SizedBox(width: 2),
                                              Container(
                                                child:  Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                              text: 'Registered: ',
                                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 13,
                                                                  fontWeight: FontWeight.normal),
                                                              children: <TextSpan>[
                                                                TextSpan(text: '10mins',
                                                                  style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 13,
                                                                      fontWeight: FontWeight.normal),
                                                                )
                                                              ]
                                                          ),
                                                        ),

                                                        Text('45 views',style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 13,
                                                            fontWeight: FontWeight.normal),)

                                                      ],
                                                    ),
                                                    SizedBox(height: 3,),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                              text: 'Last Seen: ',
                                                              style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 13,
                                                                  fontWeight: FontWeight.normal),
                                                              children: <TextSpan>[
                                                                TextSpan(text: '10mins',
                                                                  style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 13,
                                                                      fontWeight: FontWeight.normal),
                                                                )
                                                              ]
                                                          ),
                                                        ),

                                                        Text('Sell all ads',style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 13,
                                                            fontWeight: FontWeight.normal),)

                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 5,),
                                  AppButton(
                                    color: Colors.white,
                                    elevation: 0,
                                    width: context.width(),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text("LEAVE FEEDBACK",style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    shapeBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                      side: BorderSide(color: PsColors.mainColor),
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LeaveFeedBack()));
                                    },
                                  ),
                                  SizedBox(height: 5,),
                                  AppButton(
                                    color: Colors.white,
                                    elevation: 0,
                                    width: context.width(),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Text("REPORT ABUSE", style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    shapeBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                      side: BorderSide(color: PsColors.mainColor),
                                    ),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReportAbuse()));
                                    },
                                  ),
                                  SizedBox(height: 5,),
                                  AppButton(
                                    color: PsColors.mainColor,
                                    elevation: 0,
                                    width: context.width(),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("POST ADS LIKE THIS", style: TextStyle(fontFamily: 'Montserrat', color: PsColors.white, fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    shapeBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                      side: BorderSide(color: PsColors.mainColor),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    )
                  )
                ),
              ]

          ),
        )
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

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: PsColors.mainColor,
      expandedHeight: 170,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  color: PsColors.mainColor,
                  height: 150,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: Text("What are you looking for ?", style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Brutal',
                            ),
                            ),
                            ),
                            Image.asset("assets/image/search_akp.png", height: 80, width: 80,),
                          ],
                        ),
                      ]),
                ));
          }),
    );
  }

  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
      backgroundColor: PsColors.mainColor,
      pinned: true,
      floating: true,
      titleSpacing: 8,
      title: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search for the products...',
                  // textAlign: TextAlign.start,
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ],
            ),
          )
      ),
    );
  }
}
