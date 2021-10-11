import 'package:flutter/material.dart';
import 'package:ileoja/Model/FollowersModel.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';

class FollowersWidget extends StatelessWidget {
  final FollowersModel data;
  final Function onTap, onTap2;

  const FollowersWidget({
    Key key,
    @required this.data,
    this.onTap,
    this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Color(0xffFFF3F1),
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            '${data.image}',
          ),
          radius: 25,
        ),
        contentPadding: EdgeInsets.all(0),
        title: Text(
          '${data.name}',
        ),
        subtitle: Text(
          '',
        ),
        trailing: data.status == "1"
            ? TextButton(
                onPressed: onTap2,
                child: Text('Unfollow',style: setStyleContent(
                    context, Colors.white, 15, FontWeight.normal),),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: PsColors.mainColor,
                  textStyle: setStyleContent(
                      context, Colors.white, 15, FontWeight.normal),
                ),
              )
            : data.status == "3"?
              Wrap(
              children: [
                TextButton(
                  onPressed: onTap,
                  child: Text(
                      'Follow',style: setStyleContent(
                      context, Colors.white, 15, FontWeight.normal)
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: PsColors.mainColor,
                    textStyle: setStyleContent(
                        context, Colors.white, 15, FontWeight.normal),
                  ),
                ),
                SizedBox(width: 3,),
                TextButton(
                  onPressed: onTap2,
                  child: Text(
                      'Decline',style: setStyleContent(
                      context, Colors.white, 15, FontWeight.normal)
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: PsColors.mainColor,
                    textStyle: setStyleContent(
                        context, Colors.white, 15, FontWeight.normal),
                  ),
                ),
              ],
        )
            : ''
      ),
    );
  }
}
