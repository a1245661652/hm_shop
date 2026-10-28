import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final HomeRecommend homeRecommend;
  HmSuggestion({Key? key,required this.homeRecommend}) : super(key: key);

  @override
  State<HmSuggestion> createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<HmSuggestion> {
  //取取前三条数据
  List<GoodsItem> _getDisplayItems(){
    if(widget.homeRecommend.subTypes.isEmpty) return [];
    return widget.homeRecommend.subTypes.first.goodsItems.items.take(3).toList();
  }
  Widget _buildHeader(){
    return Row(
      children: [
        Text("特惠推荐",style: TextStyle(color: Colors.brown,fontSize: 18,fontWeight: FontWeight(700)),),
        SizedBox(
          width: 6,
        ),
        Text("精选省攻略",style: TextStyle(color: const Color.fromARGB(255, 125, 95, 84),fontSize: 12,),),
      ],
    );
  }
  //左侧结构
  Widget _buildLeft(){
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover)
      ),
    );
  }
  List<Widget> _getChildrenlist(){
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length,(int index){
      return Column(
        children: [
          ClipRRect(
            borderRadius:BorderRadius.circular(8),
            child:  Image.network(
              errorBuilder:(context,error,stackTrace){
                return Image.asset("lib/assets/home_cmd_inner.png",
                width: 100,
                height: 140,
                fit: BoxFit.cover,);
              },
              list[index].picture,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
              ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 114, 45),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text("¥${list[index].price}",style: TextStyle(color: Colors.white)),
          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_sm.png"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child:Column(
        
        children:[_buildHeader(),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [_buildLeft(),Expanded(child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _getChildrenlist(),
          ))],
        )],
      ),
    );
  }
}