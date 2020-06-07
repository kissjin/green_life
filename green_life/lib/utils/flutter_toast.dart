import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

toast(String message) {
  if (message == null || message.isEmpty || message.trim() == '') {
    return;
  }
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
      textColor: Colors.white,
      fontSize: ScreenUtil().setSp(28.0));
}

class ToastUtil {
  static showToast(String message) {
    if (message == null || message.isEmpty || message.trim() == '') {
      return;
    }
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
        textColor: Colors.white,
        fontSize: ScreenUtil().setSp(28.0));
  }
}
