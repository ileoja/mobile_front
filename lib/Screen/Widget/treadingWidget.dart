import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ileoja/Model/FavoriteModel.dart';
import 'package:ileoja/Model/ProductModel.dart';
import 'package:ileoja/Screen/Order/orderForm.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:loading_indicator/loading_indicator.dart';

class TreadingWidget extends StatelessWidget {
  const TreadingWidget({
    Key key,
    @required this.data,
    this.psHolder,
    this.onTap,
  }) : super(key: key);


  final ProductModel data;
  final DrValueHolder psHolder;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    //print('ddddd ${data.productImage}');
    return GestureDetector(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      child: data.productImage.length != 0
                          ? CachedNetworkImage(
                        height: SizeConfig.size100,
                        width: 110,
                        fit: BoxFit.cover,
                        imageUrl: data.productImage[0].imageFiles,
                        placeholder: (context, url) => SpinKitFadingCircle(
                          color: PsColors.white,
                          size: 50.0,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                          : Image.network(
                        'https://www.careersinafrica.com/wp-content/uploads/2020/05/placeholder.png',
                        height:SizeConfig.size96,
                        width: 110,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(11.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(data.productName, style: setStyleContent(context, PsColors.grey, 16, FontWeight.normal),maxLines: 2,) ,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.location_on, size: 15, color: PsColors.mainColor,),
                                        Text(data.stateName, style: setStyleContent(context, PsColors.grey, 15, FontWeight.normal),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text("₦${data.price}", style: setStyleContent(context, PsColors.mainColor, 16, FontWeight.normal)),
                                    ),
                                    SizedBox(width: 10,),
                                    GestureDetector(
                                      child: Container(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset('assets/image/ordenw.png', height: 18, width: 13.71,  ),
                                            SizedBox(width: 3,),
                                            Text('Order Now', style: setStyleContent(context, PsColors.white, 13, FontWeight.normal))
                                          ],
                                        ),
                                        decoration: BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                                      ),
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderForm(),),);
                                        }
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    )
                  ],
                ),
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
                                Image.asset('assets/image/whatsAp.png', height: 14, width: 16),
                                Text("Whatsapp", style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),),
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 1,
                        decoration: BoxDecoration(
                          color: PsColors.mainColor
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(4.0)),
                        ),
                      ),
                      Expanded(
                        child: Container(width: double.infinity, height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/image/call.png', height: 14, width: 16),
                                Text("Call", style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),),
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 1,
                        decoration: BoxDecoration(
                          color: PsColors.mainColor
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(4.0)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(width: double.infinity, height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/image/message.png', height: 14, width: 16),
                                Text("Message", style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),),
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
        ),
        onTap: onTap
    );
  }
}

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    Key key,
    @required this.data,
    this.psHolder,
    this.onTap,
  }) : super(key: key);


  final FavoriteModel data;
  final DrValueHolder psHolder;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    //print('ddddd ${data.productImage}');
    return GestureDetector(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            margin: EdgeInsets.only(left: 14, right: 14, top: 14),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      child: data.productImage.length != 0
                          ? CachedNetworkImage(
                        height: SizeConfig.size100,
                        width: 110,
                        fit: BoxFit.cover,
                        imageUrl: data.productImage[0].imageFiles,
                        placeholder: (context, url) => SpinKitFadingCircle(
                          color: PsColors.white,
                          size: 50.0,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                          : Image.network(
                        'https://www.careersinafrica.com/wp-content/uploads/2020/05/placeholder.png',
                        height:SizeConfig.size96,
                        width: 110,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(11.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(data.productName, style: setStyleContent(context, PsColors.grey, 16, FontWeight.normal),maxLines: 2,) ,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.location_on, size: 15, color: PsColors.mainColor,),
                                        Text(data.stateName, style: setStyleContent(context, PsColors.grey, 15, FontWeight.normal),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text("₦${data.price}", style: setStyleContent(context, PsColors.mainColor, 16, FontWeight.normal)),
                                    ),
                                    SizedBox(width: 10,),
                                    GestureDetector(
                                        child: Container(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset('assets/image/ordenw.png', height: 18, width: 13.71,  ),
                                              SizedBox(width: 3,),
                                              Text('Order Now', style: setStyleContent(context, PsColors.white, 13, FontWeight.normal))
                                            ],
                                          ),
                                          decoration: BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                                        ),
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderForm(),),);
                                        }
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    )
                  ],
                ),
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
                                Image.asset('assets/image/whatsAp.png', height: 14, width: 16),
                                Text("Whatsapp", style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),),
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 1,
                        decoration: BoxDecoration(
                          color: PsColors.mainColor
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(4.0)),
                        ),
                      ),
                      Expanded(
                        child: Container(width: double.infinity, height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/image/call.png', height: 14, width: 16),
                                Text("Call", style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),),
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 1,
                        decoration: BoxDecoration(
                          color: PsColors.mainColor
                              .withOpacity(0.5),
                          borderRadius: BorderRadius.all(
                              Radius.circular(4.0)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(width: double.infinity, height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/image/message.png', height: 14, width: 16),
                                Text("Message", style: setStyleContent(context, PsColors.black, 15, FontWeight.normal),),
                              ],
                            ),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
        ),
        onTap: onTap
    );
  }
}

class MyAdvertWidget extends StatelessWidget {
  const MyAdvertWidget({
    Key key,
    @required this.data,
    this.psHolder,
    this.onTap,
  }) : super(key: key);


  final ProductModel data;
  final DrValueHolder psHolder;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(left: 14, right: 14, top: 14),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      child: data.productImage.length != 0
                          ? CachedNetworkImage(
                        height: SizeConfig.size100,
                        width: 110,
                        fit: BoxFit.cover,
                        imageUrl: data.productImage[0].imageFiles,
                        placeholder: (context, url) => SpinKitFadingCircle(
                          color: PsColors.white,
                          size: 50.0,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                          : Image.network(
                        'https://www.careersinafrica.com/wp-content/uploads/2020/05/placeholder.png',
                        height:SizeConfig.size96,
                        width: 110,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(11.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(data.productName, style: setStyleContent(context, Color(0xff6A6B6C), 16, FontWeight.w500),maxLines: 2,) ,
                              ),
                              SizedBox(height: 1,),
                              Container(
                                child: Text("₦${data.price}", style: setStyleContent(context, PsColors.mainColor, 16, FontWeight.normal)),
                              ),
                              SizedBox(height: 1,),
                              Container(
                                child: Text("Date Created: ${data.createdAt}", style: setStyleContent(context, Color(0xff6A6B6C), 16, FontWeight.normal)),
                              ),
                            ],
                          )
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8)),
                    color: PsColors.mainColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 12),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(data.view,
                              overflow: TextOverflow.ellipsis,
                              style: setStyleContent(context,Colors.white,12,FontWeight.normal)),
                          SizedBox(height: 8),

                          Text("Impression",
                            style: setStyleContent(context,Colors.white,11,FontWeight.bold),),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('0',
                              overflow: TextOverflow.ellipsis,
                              style: setStyleContent(context,Colors.white,12,FontWeight.normal)),

                          SizedBox(height: 8),

                          Text("Visitors",
                            style: setStyleContent(context,Colors.white,11,FontWeight.bold),),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('0',
                              overflow: TextOverflow.ellipsis,
                              style: setStyleContent(context,Colors.white,12,FontWeight.normal)),
                          SizedBox(height: 8),

                          Text("Phone View",
                            style: setStyleContent(context,Colors.white,11,FontWeight.bold),),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('0',
                              overflow: TextOverflow.ellipsis,
                              style: setStyleContent(context,Colors.white,12,FontWeight.normal)),
                          SizedBox(height: 8),

                          Text("Chat Request",
                            style: setStyleContent(context,Colors.white,11,FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
        onTap: onTap
    );
  }
}


class MyListingProduct extends StatelessWidget {
  const MyListingProduct({
    Key key,
    @required this.data,
    this.psHolder,
    this.onTap,
  }) : super(key: key);


  final ProductModel data;
  final DrValueHolder psHolder;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    //print('ddddd ${data.productImage}');
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 5, left: 5),
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                            child: data.productImage.length != 0
                                ? Image.network(
                              data.productImage[0].imageFiles,

                              loadingBuilder: (BuildContext ctx, Widget child,
                                  ImageChunkEvent loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return LoadingIndicator(indicatorType: Indicator.ballPulse, color: PsColors.mainColor,);
                                }
                              },
                              height: SizeConfig.size90,
                              width: 110,
                              fit: BoxFit.cover,
                            )
                                : Image.network(
                              'https://www.careersinafrica.com/wp-content/uploads/2020/05/placeholder.png',
                              height: SizeConfig.size90,
                              width: 110,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.all(11.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text(data.productName, style: TextStyle(fontFamily: 'Montserrat', color: PsColors.grey, fontSize: 15,
                                          fontWeight: FontWeight.normal),maxLines: 2,) ,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.location_on, size: 18, color: PsColors.mainColor,),
                                              Text(data.stateName, style: TextStyle(fontFamily: 'Montserrat', color: PsColors.grey, fontSize: 15,
                                                  fontWeight: FontWeight.normal),),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text("₦${data.price}", style: TextStyle(fontFamily: 'Montserrat', color: PsColors.mainColor, fontSize: 16,
                                                fontWeight: FontWeight.normal)),
                                          ),
                                          SizedBox(width: 10,),
                                          GestureDetector(
                                              child: Container(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Image.asset('assets/image/ordenw.png', height: 18, width: 13.71,  ),
                                                    SizedBox(width: 3,),
                                                    Text('Order Now', style: setStyleContent(context, PsColors.white, 13, FontWeight.normal))
                                                  ],
                                                ),
                                                decoration: BoxDecoration(color: PsColors.mainColor, borderRadius: BorderRadius.all(Radius.circular(5))),
                                              ),
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderForm(),),);
                                              }
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                          right: 10,
                        ),
                        child:Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            width: 65,
                            height: 20,
                            padding: EdgeInsets.symmetric(horizontal: 30.0 / 2),
                            decoration: BoxDecoration(
                              color:PsColors.mainColor,
                              borderRadius: BorderRadius.circular(4),),
                            child: Center(
                              child: Text('',style: setStyleContent(context,PsColors.white,10,FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                                  Text("Message", style: TextStyle(fontFamily: 'Montserrat', color: PsColors.black, fontSize: 15,
                                      fontWeight: FontWeight.normal),),
                                ],
                              ),
                              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
        onTap: onTap
    );
  }
}

