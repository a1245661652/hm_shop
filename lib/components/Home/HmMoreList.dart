import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  HmMoreList({Key? key}) : super(key: key);

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    //必须是Sliver家族的组件
    return SliverGrid.builder( gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10), 
      itemBuilder: (BuildContext context, int index){
        return Container(
          child: Text("商品",style: TextStyle(color: Colors.white),),
          color: Colors.blue,
          alignment: Alignment.center,
        );
      }
      );
  }
}