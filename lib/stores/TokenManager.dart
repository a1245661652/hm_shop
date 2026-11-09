import 'package:hm_shop/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager{
  String _token = '';
  //获取Token实例
  Future<SharedPreferences> _getInstance() {
    return  SharedPreferences.getInstance();
  }
  //初始化Token
  Future<void> init() async{
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? '';
  }
  //设置Token
  Future<void> setToken(String token) async{
    final prefs = await _getInstance();
    _token = token;
    prefs.setString(GlobalConstants.TOKEN_KEY, token);
  }
  //获取Token
  String getToken() {
    return _token;
  }
  //移除Token
  Future<void> removeToken() async{
    final prefs = await _getInstance();
    _token = '';
    prefs.remove(GlobalConstants.TOKEN_KEY);
  }
}
//单例模式
final tokenManager = TokenManager();