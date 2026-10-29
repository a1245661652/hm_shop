import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/utils/ToastUtils.dart';
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
  SpecialRecommendResult _inVogueResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  SpecialRecommendResult _oneStopResult = SpecialRecommendResult(
    id: "",
    title: "",
    subTypes: [],
  );
  // 推荐列表
  List<GoodDetailItem> _recommendList = [];
  //页码
  int _page = 1;
  int _limit = 10;
  bool _isLoading = false;//是否正在加载
  bool _hasMore = true;//是否还有下一页
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
                children: [
                 Expanded(child:HmHot(result: _inVogueResult,type:"hot")) ,
                 SizedBox(width: 10,),
                 Expanded(child: HmHot(result: _oneStopResult,type:"step")) ],
              ),
            )
        ),
        //间距组件
        SliverToBoxAdapter(child: SizedBox(height: 10,)),
        HmMoreList(recommendList: _recommendList), 
      ];
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerScrollController();
    // _getBannederList();
    // _getCategoryList();
    // _getHomeRecommendList();
    // _getInVogueList();
    // _getOneStopList();
    // _getRecommendList();
    Future.microtask((){
      _paddingTop = 100;
      setState(() {
      });
      _globalKey.currentState?.show();
    });
  }
  //监听滚动刀到底部的事件
  void _registerScrollController(){
    _scrollController.addListener(() {
        if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100){
          print("到底了");
          _getRecommendList();
        }
    });
  }
  Future<void> _getBannederList() async{
    _bannerList = await getBannerListAPI();
    
  }
  //获取分类列表
  Future<void> _getCategoryList() async{
    _categoryList = await getCategoryListAPI();
   
  }
  //获取特惠推荐结果
  Future<void> _getHomeRecommendList() async{
    homeRecommend = await getHomeRecommendListAPI();
    
  }
  //获取爆款推荐列表
  Future<void> _getInVogueList() async{
    _inVogueResult = await getInVogueListAPI();
   
  }
  //获取一站买全列表
  Future<void> _getOneStopList() async{
    _oneStopResult = await getOneStopListAPI();
    
  }
  // 获取推荐列表
  Future<void> _getRecommendList() async {
    //如果正在加载或者没有下一页了，就不加载了
    if(_isLoading || !_hasMore){
      return;
    }
    _isLoading = true;
    _limit = _page * 10;
    _recommendList = await getRecommendListAPI({"limit": _limit});
    setState(() {});
    _isLoading = false;
    _hasMore = homeRecommend.subTypes.isNotEmpty;
    print(_hasMore);
    _page++;
    
  }
  Future<void> _refresh() async {
    _page = 1;
    _limit = 10;
    _hasMore = true;
    await _getBannederList();
    await _getCategoryList();
    await _getHomeRecommendList();
    await _getInVogueList();
    await _getOneStopList();
    await _getRecommendList();
    setState(() {
      ToastUtils.showToast(context,"刷新成功",2);
      _paddingTop = 0;  
      setState(() {
      });
    });
  }
  final ScrollController _scrollController = new ScrollController();
  final GlobalKey<RefreshIndicatorState> _globalKey = GlobalKey<RefreshIndicatorState>();
  double _paddingTop = 0;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _globalKey,
      onRefresh: _refresh,
       child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(top: _paddingTop),
        child: CustomScrollView(
        slivers: _getScrollChildren(),
        controller: _scrollController,
       ),
       ),
    );
  }
 
}