
import 'package:flutter/material.dart';
import 'package:ileoja/Model/PackageModel.dart';
import 'package:ileoja/Model/PackagePermissionModel.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class PackageView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final PackageModel data;
  final DrValueHolder psHolder;
  final Function onTap;

  const PackageView(
      {Key key, this.animationController, this.animation,
        @required this.data,
        this.psHolder,
        this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 16, bottom: 6),
        child: Container(
          decoration: BoxDecoration(
            color: PsColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topRight: Radius.circular(8.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: PsColors.grey.withOpacity(0.2),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 4),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 2),
                                        child: Text(
                                            '${data.name}',
                                            textAlign: TextAlign.center,
                                            style: setStyleContent(context,PsColors.black,16,FontWeight.bold)
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 4, bottom: 3),
                                            child: Text(
                                                'Price',
                                                textAlign: TextAlign.center,
                                                style: setStyleContent(context,PsColors.black,16,FontWeight.normal)
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                left: 4, bottom: 3),
                                            child: Text(
                                                '₦ ${data.price}',
                                                textAlign: TextAlign.center,
                                                style: setStyleContent(context,PsColors.black,12,FontWeight.normal)
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),

                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Center(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: PsColors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                  border: new Border.all(
                                      width: 4,
                                      color: PsColors
                                          .mainColor
                                          .withOpacity(0.2)),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${data.duration}',
                                      textAlign: TextAlign.center,
                                      style: setStyleContent(context,PsColors.black,12,FontWeight.bold),
                                    ),
                                    Text(
                                        'Days',
                                        textAlign: TextAlign.center,
                                        style: setStyleContent(context,PsColors.black,12,FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child:Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                            '${data.description}',
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                            softWrap: true,
                            style: setStyleContent(context,PsColors.black,14,FontWeight.normal)
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 8, bottom: 8),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: PsColors.mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 8, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Refresh Duration',
                            textAlign: TextAlign.center,
                            style: setStyleContent(context,PsColors.black,12,FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              '${data.minutesDuration} min(s)',
                              textAlign: TextAlign.center,
                              style: setStyleContent(context,PsColors.black,12,FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Special FaceBook',
                                textAlign: TextAlign.center,
                                style: setStyleContent(context,PsColors.black,12,FontWeight.bold),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  data.facebookAdsDuration == "0"? 'No': 'Yes',
                                  textAlign: TextAlign.center,
                                  style: setStyleContent(context,PsColors.black,12,FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

class PackageCategoryView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final PackagePermissionModel data;
  final DrValueHolder psHolder;
  final Function onTap;

  const PackageCategoryView(
      {Key key, this.animationController, this.animation,
        @required this.data,
        this.psHolder,
        this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 5, left: 5),
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Image.network(data.picture,height: 30,width: 30,),
              ),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.catName,
                    style: setStyleContent(context,PsColors.black,15,FontWeight.normal),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Picture Limit: ',
                      style: setStyleContent(context,PsColors.black,13,FontWeight.normal),
                      children: <TextSpan>[
                        TextSpan(
                            text: data.packageValue,
                            style: setStyleContent(context,PsColors.mainColor,13,FontWeight.normal),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Expanded(child: Container()),

            ],
          ),
        )
      )
    );
  }
}


