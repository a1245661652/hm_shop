//管理路由
import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';
//返回APP根级组件
Widget getRootWidget(){
    return MaterialApp(
      //命名路由
      initialRoute:'/',
      routes:getRoutes(),
    );
}
//返回该APP的路由配置
Map<String, Widget Function(BuildContext)> getRoutes(){
  return {
    '/':(context)=>MainPage(),//首页
    '/login':(context)=>LoginPage()//登录页
  };
}