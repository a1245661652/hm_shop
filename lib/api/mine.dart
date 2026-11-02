import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<GoodsDetailItems> getGuessListAPI(
    Map<String, dynamic> params,
) async{
  // 返回请求
  return GoodsDetailItems.formJson(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params)
  );
}
