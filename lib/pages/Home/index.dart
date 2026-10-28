import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [
    // BannerItem(id: "1", imgUrl:"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nuandong_sj.png" ),
    // BannerItem(id: "2", imgUrl:"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/nvshen_sj.png" ),
    // BannerItem(id: "3", imgUrl:"https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/banner/xinnian_sj.png" )
  ];
  List<CategoryItem> _categoryList = [];
  HomeRecommend homeRecommend = HomeRecommend(
    id: "",
    title: "",
    subTypes: [],
  );


  List<Widget> _getScrollChildren (){
      return [
        //包裹普通widget的sliver家族的组件
        SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList,)),
        //间距组件
        SliverToBoxAdapter(child: SizedBox(height: 10,)),
        //横向滚动  SliverGrid SliverList 只能纵向排列
        SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList,), ),
        //间距组件
        SliverToBoxAdapter(child: SizedBox(height: 10,)),

        SliverToBoxAdapter(child: HmSuggestion(homeRecommend: homeRecommend,), ),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannederList();
    _getCategoryList();
    _getHomeRecommendList();
  }
  void _getBannederList() async{
    _bannerList = await getBannerListAPI();
    setState(() {
      
    });
  }
  //获取分类列表
  void _getCategoryList() async{
    _categoryList = await getCategoryListAPI();
    setState(() {
      
    });
  }
  //获取特惠推荐结果
  void _getHomeRecommendList() async{
    homeRecommend = await getHomeRecommendListAPI();
    setState(() {
      
    });
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