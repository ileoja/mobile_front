import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:ileoja/Model/FeedBackIniModel.dart';
import 'package:ileoja/Provider/feedback/feedback_provider.dart';
import 'package:ileoja/Reprository/feedback_repository.dart';
import 'package:ileoja/Reprository/user_repository.dart';
import 'package:ileoja/acadaar_ctrl/common/dr_value_holder.dart';
import 'package:ileoja/acadaar_ctrl/config/dr_config.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';
import 'package:provider/provider.dart';

class FeedBackDataIndex extends StatefulWidget{
  const FeedBackDataIndex({
    Key key,
    @required this.data,
  }) : super(key: key);

  final String data;
  @override
  FeedBackDataIndexState createState() => FeedBackDataIndexState();
}

class FeedBackDataIndexState extends State <FeedBackDataIndex>{
  UserRepository userRepository;
  DrValueHolder psValueHolder;
  FeedbackProvider feedbackProvider;
  FeedbackRepository feedbackRepository;

  @override
  void initState() {
    // loadBack();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<FeedbackIniModel> fetchSmile() async {
    Map<String, String> headers = {'Authorization': 'Bearer ' + psValueHolder.apiToken};
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),headers:headers);
    if (response.statusCode == 200) {
      return FeedbackIniModel().fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    userRepository = Provider.of<UserRepository>(context);
    psValueHolder = Provider.of<DrValueHolder>(context);
    feedbackProvider = FeedbackProvider(repo: feedbackRepository, psValueHolder: psValueHolder);
    feedbackRepository = Provider.of<FeedbackRepository>(context);
    return PlatformScaffold(
      iosContentBottomPadding: true,
      iosContentPadding: true,
      body: SingleChildScrollView(
          child: ChangeNotifierProvider<FeedbackProvider>(
            lazy: false,
            create: (BuildContext context) {
              final FeedbackProvider provider = FeedbackProvider(repo: feedbackRepository, psValueHolder: psValueHolder);
              provider.getData(psValueHolder.apiToken, 'status=${widget.data}','2');
              feedbackProvider = provider;
              return feedbackProvider;
            },
            child: Consumer<FeedbackProvider>(
                builder: (BuildContext context, FeedbackProvider provider, Widget child) {
                 // print('filedate'+feedbackProvider.feedbackData.data.smileCount);
                  if (feedbackProvider != null && feedbackProvider.feedbackData != null && feedbackProvider.feedbackData.data != null) {
                    return Column(
                      children: [
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(left: 14, right: 14, top: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            color: Color(0xffE9E9E9),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(DrConfig.getImage('smile.png'),height: 20,),
                                  SizedBox(width: 10,),
                                  Text('Happy - 1',style: setStyleContent(context, Colors.green, 14, FontWeight.normal),)
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(DrConfig.getImage('neutral.png'),height: 20,),
                                  SizedBox(width: 10,),
                                  Text('Neutral - 0',style: setStyleContent(context, Color(0xff6A6B6C), 14, FontWeight.normal),)
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(DrConfig.getImage('sad.png'),height: 20,),
                                  SizedBox(width: 10,),
                                  Text('Sad - 0',style: setStyleContent(context, Colors.red, 14, FontWeight.normal),)
                                ],
                              )
                            ],
                          ),
                        ),
                        // Consumer<FeedbackProvider>(builder: (
                        //     BuildContext context,
                        //     FeedbackProvider paymentPackage,
                        //     Widget child,
                        //     ) {
                        //   if (feedbackProvider.dataList.data != null) {
                        //     return Column(
                        //       crossAxisAlignment: CrossAxisAlignment.stretch,
                        //       children: <Widget>[
                        //         Expanded(
                        //           child: ListView.builder(
                        //             shrinkWrap: true,
                        //             itemBuilder: (BuildContext context, int index) {
                        //               return MyAdvertWidget(
                        //                 data: feedbackProvider.dataList.data[index],
                        //                 onTap: () async {},
                        //               );
                        //             },
                        //             itemCount: feedbackProvider.dataList.data.length,
                        //           ),
                        //         ),
                        //         PSProgressIndicator(feedbackProvider.dataList.status,context),
                        //
                        //       ],
                        //     );
                        //   } else {
                        //     return WidgetNoData();
                        //   }
                        // }),
                      ],
                    );
                  }else{
                    return Text('Not found');
                  }
                }),

          ),
      ),
    );
  }
}