import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApplicationToast{
  static getErrorToast({@required int ? durationTime, @required String ? heading}) async{

   await  Fluttertoast.showToast(
        msg: heading??"Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: durationTime??2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

  static getSuccessToast({@required int ? durationTime, @required String ? heading}) async{
    await  Fluttertoast.showToast(
        msg: heading??"Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: durationTime??2,
        backgroundColor: Colors.lightGreen,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static getWarningToast({@required int ? durationTime, @required String ? heading, @required String ? subHeading}) async{
    await  Fluttertoast.showToast(
        msg: heading??"Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: durationTime??2,
        backgroundColor: Colors.yellowAccent,
        textColor: Colors.black,
        fontSize: 16.0

    );
  }


}