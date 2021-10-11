
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ileoja/Model/ManagerContentModel.dart';
import 'package:ileoja/Model/ManagerLogModel.dart';
import 'package:ileoja/Provider/manager_log/manager_log_provider.dart';
import 'package:ileoja/Provider/user/user_provider.dart';
import 'package:ileoja/Reprository/manager_log_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/Screen/Mics/listManagerContent.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_resource.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/ps_progress_dialog.dart';
import 'package:ileoja/acadaar_ctrl/common/utils/utils.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/size_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:provider/provider.dart';

class AddManagerLogScreen extends StatefulWidget {

  @override
  _AddManagerLogScreenState createState() => _AddManagerLogScreenState();
}

class _AddManagerLogScreenState extends State<AddManagerLogScreen> {

  UserRepository userRepository;
  DrValueHolder psValueHolder;
  UserProvider userProvider;
  ManagerLogProvider _managerLogProvider;
  ManagerLogRepository _managerLogRepository;
  ManagerContentModel _managerContentModel;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController chooseReason = new TextEditingController();
  final TextEditingController chooseReasonID = new TextEditingController();
  final TextEditingController description = new TextEditingController();
  final TextEditingController activePhone = new TextEditingController();

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
    _managerLogRepository = Provider.of<ManagerLogRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    SizeConfig().init(context);

    return PlatformScaffold(
      backgroundColor: Colors.white,
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: Column(
       children: [
         Center(
           child: Column(
             children: [
               Container(
                 height: 100,
                 margin: EdgeInsets.all(120),
                 child: Center(
                   child: Image.asset('assets/image/tick.png', height: 62,),
                 ),
                 decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight,
                     colors: [Colors.pink, PsColors.mainColor]), borderRadius: BorderRadius.circular(25)),
               ),
               Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Expanded(
                         child: Text('Your request has been sent successfully.',
                             textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'Montserrat'))),
                   ],
                 ),
             ],
           ),
         ),
       ]

      ),
    );
  }

}


