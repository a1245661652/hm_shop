import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmHot extends StatefulWidget {
  //爆款推荐
  final SpecialRecommendResult result;
  //类型
  final String type;
  HmHot({Key? key,required this.result,required this.type}) : super(key: key);

  @override
  _HmHotState createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  //取取前三条数据
  List<GoodsItem> _getDisplayItems(){
    if(widget.result.subTypes.isEmpty) return [];
    return widget.result.subTypes.first.goodsItems.items.take(2).toList();
  }

  Widget _buildHeader(){
    return Row(
        children:[
          Text(widget.type == "hot"?"爆款推荐":"一站买全",style: TextStyle(color: Color.fromARGB(255, 86, 24, 20),fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(width: 10,),
          Text(widget.type == "hot"?"最受欢迎":"精挑细选",style: TextStyle(color: Color.fromARGB(255, 124, 63, 58),fontSize: 12),),
        ],
    );
  }
  //获取子组件
  List<Widget> _getChildrenList(List<GoodsItem> list){
    return list.map((e) {
      return Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:Image.network(
                    e.picture,
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder:(context, error, stackTrace) {
                      return Image.asset("lib/assets/home_cmd_inner.png");
                    },),
                  
                ),
                SizedBox(height: 5,),
                Text("￥${e.price}",style: TextStyle(color: Color.fromARGB(255, 86, 24, 20),fontSize: 12,)),
        ]
        ),
    );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<GoodsItem> list = _getDisplayItems();
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:widget.type=="hot"?
         const Color.fromARGB(255, 249, 247, 219): const Color.fromARGB(255, 211, 228, 240),
      ),
      alignment: Alignment.center,
      child: Column(
        children:[
          _buildHeader(),
          SizedBox(height: 10,),
           Container(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children:_getChildrenList(list),
            ),
            ),
          
        ],
      )
    );
  }
}
