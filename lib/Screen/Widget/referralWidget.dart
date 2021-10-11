
import 'package:flutter/material.dart';
import 'package:ileoja/Model/PackageModel.dart';
import 'package:ileoja/Model/PackagePermissionModel.dart';
import 'package:ileoja/Model/ReferralModel.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class ReferralWidget extends StatelessWidget {
  final ReferralModel data;
  
  const ReferralWidget(
      {Key key,
        @required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PsColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'SELLER NAME',
                    style: setStyleContent(
                        context,
                        Color.fromRGBO(8, 19, 61, 0.6),
                        11,
                        FontWeight.w500),
                  ),
                  SizedBox(
                      height: SizeConfig.screenHeight *
                          0.008),
                  Text(
                    data.userModel.name,
                    style: setStyleContent(
                        context,
                        Color.fromRGBO(0, 0, 0, 0.7),
                        11,
                        FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'PHONE',
                    style: setStyleContent(
                        context,
                        Color.fromRGBO(8, 19, 61, 0.6),
                        11,
                        FontWeight.w500),
                  ),
                  SizedBox(
                      height: SizeConfig.screenHeight *
                          0.008),
                  Text(
                    data.userModel.phone,
                    style: setStyleContent(
                        context,
                        Color.fromRGBO(0, 0, 0, 0.7),
                        11,
                        FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'STATUS',
                    style: setStyleContent(
                        context,
                        Color.fromRGBO(8, 19, 61, 0.6),
                        11,
                        FontWeight.w500),
                  ),
                  SizedBox(
                      height: SizeConfig.screenHeight *
                          0.008),
                  data.status == 'npaid'?
                  Text(
                  'Not Paid',
                  style: setStyleContent(
                  context,
                  Colors.red, 11, FontWeight.bold),)
                      :
                  Text(
                    'Paid',
                    style: setStyleContent(
                        context,
                        Colors.green, 11, FontWeight.bold),)
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'DATE JOINED',
                    style: setStyleContent(
                        context,
                        Color.fromRGBO(8, 19, 61, 0.6),
                        11,
                        FontWeight.w500),
                  ),
                  SizedBox(
                      height: SizeConfig.screenHeight *
                          0.008),
                  Text(
                    data.createdAt,
                    style: setStyleContent(
                        context,
                        Color.fromRGBO(0, 0, 0, 0.7),
                        11,
                        FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'DATE EXPIRED',
                    style: setStyleContent(
                        context,
                        Color.fromRGBO(8, 19, 61, 0.6),
                        11,
                        FontWeight.w500),
                  ),
                  SizedBox(
                      height: SizeConfig.screenHeight *
                          0.008),
                  Text(
                    data.expiredAt,
                    style: setStyleContent(
                        context,
                        Colors.red,
                        11,
                        FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
