 
import 'package:flutter/material.dart';
import 'package:v4/theme/colors.dart';

class CustomSnackBar {
  GlobalKey<ScaffoldState> scaffoldKey;
  bool haserror = false;
  String title, actionTile;
  VoidCallback onPressed;
  bool isfloating;

  CustomSnackBar(
      {required this.scaffoldKey,
      required this.title,
      required this.haserror,
      required this.actionTile,
      required this.isfloating,
      required this.onPressed});

  void show() {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      backgroundColor: haserror ? errorColor : succses,
      behavior: isfloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
      margin: isfloating ? EdgeInsets.all(20) : null,
      duration: Duration(seconds: 2),
      action: actionTile != ""
          ? SnackBarAction(
              label: actionTile,
              onPressed: onPressed == null
                  ? () {
                      scaffoldKey.currentState!.hideCurrentSnackBar();
                    }
                  : onPressed,
              textColor: white,
            )
          : null,
    ));
  }
}
