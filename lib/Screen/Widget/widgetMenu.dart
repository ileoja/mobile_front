import 'package:flutter/material.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';
import 'package:ileoja/acadaar_ctrl/config/style.dart';


class MenuWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool n;

  const MenuWidget(
      {Key key,
        @required this.title,
        @required this.subtitle,
        @required this.onTap,
        @required this.n})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: InkWell(
        child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat'),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: PsColors.grey, fontFamily: 'Montserrat'),
        ),
        trailing: Icon(Icons.chevron_right),
      ),
        onTap: onTap,),
      decoration: BoxDecoration(border: Border.all(color: n==false?Color(0xffE9E9E9):PsColors.mainColor), borderRadius: BorderRadius.circular(8)),
    );
  }
}



class SettingsMenuWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsMenuWidget(
      {Key key,
        @required this.title,
        @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        child: Row(
          children: <Widget>[
            Text(title,style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15, color: PsColors.black, fontFamily: 'Montserrat')),
            Spacer(),
            Icon(Icons.edit, color: Colors.grey.shade700,size: 16,),
            Container(width: 10)
          ],
        ),
        decoration: BoxDecoration(border: Border.all(color: Color(0xffE9E9E9)), borderRadius: BorderRadius.circular(8)),
      ),
      onTap: onTap,
    );
  }
}

//