import 'package:flutter/material.dart';

class ToastUtils{
  //阀门控制
  static bool showLoading = false;

  static void showToast(BuildContext context, [String msg = "加载成功", int seconds = 2]){
    if(ToastUtils.showLoading){
      return;
    }
    ToastUtils.showLoading = true;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          width: 180,
          content: Text(msg,textAlign: TextAlign.center,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: seconds),
        ))
        .closed
        .then((_) {
          print("关闭");
          ToastUtils.showLoading = false;
        });
  }

  static void show(String s) {}
}