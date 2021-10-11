
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ileoja/Model/UserModel.dart';
import 'package:ileoja/Provider/manager_log/manager_log_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/manager_log_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Profile/ManageLog/addManagerLog.dart';
import 'package:ileoja/Screen/Widget/widgetManager.dart';
import 'package:ileoja/Screen/Widget/widgetNoData.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:ileoja/acadaar_ctrl/uiWidget/loadingIndicator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AccountOfficer extends StatefulWidget {
  const AccountOfficer({
    Key key,
    @required this.data,
  }) : super(key: key);
  final UserModel data;
  @override
  _AccountOfficerState createState() => _AccountOfficerState();
}

class _AccountOfficerState extends State<AccountOfficer> {

  DrValueHolder psValueHolder;
  UserRepository userRepo;
  UserProvider userProvider;
  bool bindDataFirstTime = true;
  ManagerLogProvider _managerLogProvider;
  ManagerLogRepository _managerLogRepository;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,
        appBar: PlatformAppBar(
          title: Text('Account Officer',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: PsColors.black, fontFamily: 'Montserrat'),),
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
        body: Container(
          child: Column(
            children: [
              Container(
                color:  Color(0xffF1F1F1),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'http://vectips.com/wp-content/uploads/2019/11/tutorial-preview-large.png')
                            )),
                        ),
                      ),
                    SizedBox(height: 11,),
                    Text('Admin', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: PsColors.black, fontFamily: 'Montserrat')),
                    SizedBox(height: 5,),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemSize: 15,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: EdgeInsets.only(right: 10,left: 10),
                      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(15))),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(width: double.infinity, height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/image/whatsAp.png', height: 14, width: 16),
                                    Text("Whatsapp", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
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
                                    Text("Call", style:TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),),
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
                                    Text("Message", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
                                  ],
                                ),
                                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.all(Radius.circular(5)))
                            ),
                          ),

                        ],
                      ),

                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemSize: 40,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 5,),
              Container(
                height: 160,
                margin: EdgeInsets.all(15),
                child: Align(alignment: Alignment.centerLeft,
                    child: Text('Reason for the rating', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),)
                ),
                decoration: BoxDecoration(border: Border.all(),  borderRadius: BorderRadius.circular(8)),
                ),
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: Container(
                    height: 52.0,
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PsColors.mainColor,
                        border: Border.all(color: Colors.white)),
                    child: Center(
                        child: Text("SEND",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: PsColors.white, fontFamily: 'Montserrat'))),
                  ),
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddManagerLogScreen()));
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
