import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  //接收一个分类列表
  final List<CategoryItem> categoryList;
  const HmCategory({Key? key,required this.categoryList}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          //根据索引获取分类项
          CategoryItem categoryItem = widget.categoryList[index];
          return Container(
              alignment: Alignment.center,
              width: 80,
              height:100,
              decoration: BoxDecoration(
                color:Color.fromARGB(255,231,232,234),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(categoryItem.picture,width: 40,height: 40,),
                  SizedBox(height: 5,),
                  Text(categoryItem.name,style: TextStyle(color: Colors.black,fontSize: 12),),
                ],
              )
          );
        },
      )
    );
  }
}