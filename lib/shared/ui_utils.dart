import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mychat/shared/app_theme.dart';

class UiUtils{
  static void showDilog(BuildContext context)=>
      showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_)=>
      PopScope(
        canPop: false,
        child: AlertDialog(

          content:
          SizedBox(
              height: MediaQuery.of(context).size.height*0.15,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppTheme.primarycolor,

                  ),
                ],
              )),),
      ));
  static void hideDialog(BuildContext context)=>Navigator.of(context).pop();
static void showMessage(String message,Color bg)=>Fluttertoast
    .showToast(msg: message,
backgroundColor: bg,
  textColor: AppTheme.white,
  toastLength:Toast.LENGTH_LONG,
  timeInSecForIosWeb: 10
);
}