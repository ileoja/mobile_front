import 'package:flutter/material.dart';
import 'package:ileoja/Model/ManagerLogModel.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class ManagerLogWidget extends StatelessWidget {
  final ManagerLogModel data;
  final Function onTap;

  const ManagerLogWidget(
      {Key key,
        @required this.data,
        this.onTap,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 3)
        ], color: Colors.white, borderRadius: BorderRadius.circular(9.0)),
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
        child: Container(
          child: Row(
            children: <Widget>[
              // SizedBox(width: 9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${data.subject}",
                          style: setStyleContent(context,PsColors.black,15,FontWeight.bold),
                        ),
                        data.status == "Pending"?
                        Text(
                          "Pending",
                          style: setStyleContent(context,PsColors.redColor,12,FontWeight.bold),
                        ):
                        Text(
                          "Resolved",
                          style: setStyleContent(context,Colors.green,12,FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 2,),
                    RichText(
                      text: TextSpan(
                          text: 'Date Created: ',
                          style: setStyleContent(context,PsColors.black,13,FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(text: DrConfig.dateFormatToString(data.createdAt),
                              style: setStyleContent(context,PsColors.black,13,FontWeight.normal),

                            )
                          ]
                      ),
                    ),
                    SizedBox(height: 2,),
                    data.status == "Pending"?
                    SizedBox(height: 1,):
                    RichText(
                      text: TextSpan(
                          text: 'Date Resolved: ',
                          style: setStyleContent(context,PsColors.mainColor,14,FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text:data.approveDate,
                              style: setStyleContent(context,PsColors.black,13,FontWeight.normal),

                            )
                          ]
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      "${data.description}",
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      style: TextStyle(color: Colors.grey),
                    ),


                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}