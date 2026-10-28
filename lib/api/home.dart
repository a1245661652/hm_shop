//封装一个api 目的是返回业务侧要的数据结构
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map(
  (item){
  return  BannerItem.fromJSON(item as Map<String,dynamic>);
 }).toList();
}
//获取分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map(
  (item){
  return  CategoryItem.fromJSON(item as Map<String,dynamic>);
  }).toList();
}
//HomeRecommend 特惠推荐结果
Future<HomeRecommend> getHomeRecommendListAPI() async {
  //返回请求
  return  HomeRecommend.fromJSON(
    await dioRequest.get(HttpConstants.PRODUCT_LIST)
  );
}
//热榜推荐
Future<SpecialRecommendResult> getInVogueListAPI() async{
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST)
  );
}
//一站式推荐
Future<SpecialRecommendResult> getOneStopListAPI() async{
  return SpecialRecommendResult.fromJSON(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST)
  );
}
//推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}