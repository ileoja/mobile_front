import 'package:flutter/material.dart';
import 'package:ileoja/Model/SubCategoryModel.dart';

class SubCategoryWidget extends StatelessWidget {
  final SubCategoryModel data;
  final Function onTap;

  const SubCategoryWidget(
      {Key key,
        @required this.data,
        this.onTap,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        margin: EdgeInsets.all(6),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              '${data.picture}',
            ),
            radius: 25,
          ),
          contentPadding: EdgeInsets.all(0),
          title: Text('${data.subCatName}',),
        ),
      ),
    );
  }
}