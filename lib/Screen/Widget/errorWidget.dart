
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ileoja/acadaar_ctrl/config/ps_colors.dart';


void showAuthAndroid(context) {
  showModalBottomSheet(context: context, isDismissible: false,  builder: (BuildContext bc) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Wrap(
        spacing: 60,
        children: <Widget>[
          Container(height: 10),
          Text("Error Message", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
          Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade200,
                      Colors.grey.shade200,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('https://i.postimg.cc/6qMTfNpM/google-symbol.png',height: 25,width: 25,),
                    Text('Sign up with Google', style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center,)
                  ]
              )
          ),
          SizedBox(height: 10,),
          Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade900,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('f', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                        color: Colors.white),),
                    Text(' Sign up with Google ', style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,)
                  ]
              )
          ),
          SizedBox(height: 10,),
          Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      PsColors.mainColor,
                      PsColors.mainColorSecondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text('Sign up with Email or Phone', style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 16, color: Colors.white),),
              )
          )
        ],
      ),
    );
  });
}


void showErrorAndroid(context, errorMessage) {
  showModalBottomSheet(context: context, isDismissible: false,  builder: (BuildContext bc) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Wrap(
        spacing: 60,
        children: <Widget>[
          Container(height: 10),
          Text("Error Message", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
          Container(height: 10),
          Container(
            child: Text(errorMessage,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18
              ),
            ),
          ),
          Container(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new FlatButton(
                textColor:  PsColors.mainColorWithBlack,
                color: Colors.transparent,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: new Text("Contact Support"),
              ),
              new RaisedButton(
                textColor: Colors.white,
                color: PsColors.redColor,
                onPressed: (){},
                child: new Text("Exit"),
              )
            ],
          )
        ],
      ),
    );
  });
}

void showErrorIos(context, errorMessage) {
  showCupertinoModalPopup(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Error Message'),
      message: Text(errorMessage,
        style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18
        ),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Contact Support'),
          onPressed: () {
            Navigator.pop(context, 'One');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Exit'),
          onPressed: () {
            Navigator.pop(context, 'Two');
          },
        )
      ],
    ),
  );
}

void showVersionAndroid(context, errorMessage) {
  showModalBottomSheet(context: context, isDismissible: false,  builder: (BuildContext bc) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Wrap(
        spacing: 60,
        children: <Widget>[
          Container(height: 10),
          Text("Error Message", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
          Container(height: 10),
          Container(
            child: Text(errorMessage,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18
              ),
            ),
          ),
          Container(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new FlatButton(
                textColor:  PsColors.mainColorWithBlack,
                color: Colors.transparent,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: new Text("Contact Support"),
              ),
              new RaisedButton(
                textColor: Colors.white,
                color: PsColors.redColor,
                onPressed: (){},
                child: new Text("Exit"),
              )
            ],
          )
        ],
      ),
    );
  });
}

void showVersionIos(context, errorMessage) {
  showCupertinoModalPopup(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CupertinoActionSheet(
      title: const Text('Error Message'),
      message: Text(errorMessage,
        style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18
        ),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('Contact Support'),
          onPressed: () {
            Navigator.pop(context, 'One');
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Exit'),
          onPressed: () {
            Navigator.pop(context, 'Two');
          },
        )
      ],
    ),
  );
}