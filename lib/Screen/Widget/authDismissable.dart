// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:ileoja/Screen/Widget/customBottomPoP.dart';
// import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
//
// class AuthDismissible extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//     if(Platform.isAndroid){
//       showMaterialModalBottomSheet(
//         context: context,
//         builder: (context) => SingleChildScrollView(
//           controller: ModalScrollController.of(context),
//           child: Container(
//             child: Text('ss'),
//           ),
//         ),
//       );
//     }else if(Platform.isIOS){
//       showCupertinoModalBottomSheet(
//         context: context,
//         builder: (context) => Container(
//           child: Text('ss'),
//         ),
//       );
//     }else{
//       showMaterialModalBottomSheet(
//         context: context,
//         builder: (context) => SingleChildScrollView(
//           controller: ModalScrollController.of(context),
//           child: Container(
//             child: Text('ss'),
//           ),
//         ),
//       );
//     }
//
//   }
// }