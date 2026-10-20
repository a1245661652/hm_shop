import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildren (){
      return [
        //包裹普通widget的sliver家族的组件
        SliverToBoxAdapter(child: HmSlider()),
        //间距组件
        SliverToBoxAdapter(child: SizedBox(height: 10,)),
        //横向滚动  SliverGrid SliverList 只能纵向排列
        SliverToBoxAdapter(child: HmCategory(), ),
        //间距组件
        SliverToBoxAdapter(child: SizedBox(height: 10,)),

        SliverToBoxAdapter(child: Hmsuggestion(), ),
        //间距组件
        SliverToBoxAdapter(child: SizedBox(height: 10,)),

        SliverToBoxAdapter(child:
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
              child:  Flex(
                direction: Axis.horizontal,
                children: [Expanded(child: HmHot()) ,SizedBox(width: 10,),Expanded(child: HmHot()) ],
              ),
            )
        ),
        //间距组件
        SliverToBoxAdapter(child: SizedBox(height: 10,)),
        HmMoreList()
      ];
  }
  @override
  Widget build(BuildContext context) {
    return Center(
       child: CustomScrollView(
        slivers: _getScrollChildren(),
       ),
    );
  }
}