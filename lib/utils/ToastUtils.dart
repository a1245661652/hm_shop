import 'package:flutter/material.dart';

class ToastUtils{
  static void showToast(BuildContext context,String msg,[int seconds = 2]){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        width: 120,
        content: Text(msg ?? "加载成功",textAlign: TextAlign.center,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: seconds),
      ));
  }
}