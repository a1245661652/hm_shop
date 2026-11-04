import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/mine.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/Mine/HmGuess.dart';
import 'package:hm_shop/stores/UserController.dart';
import 'package:hm_shop/viewmodels/home.dart';

class MineView extends StatefulWidget {
  MineView({Key? key}) : super(key: key);

  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  final UserController _userController = Get.put(UserController());
  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFFFFF2E8), const Color(0xFFFDF6F1)],
        ),
      ),
      padding: const EdgeInsets.only(left: 20, right: 40, top: 80, bottom: 20),
      child: Row(
        children: [
          Obx((){
              return CircleAvatar(
                radius: 26,
                backgroundImage:_userController.user.value.avatar.isNotEmpty? NetworkImage(_userController.user.value.avatar):AssetImage('lib/assets/goods_avatar.png'),
                backgroundColor: Colors.white,
              );
            }
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx((){
                  return GestureDetector(
                  onTap: () {
                    // 跳转登录页
                    if(_userController.user.value.id.isEmpty){
                        Navigator.pushNamed(context, "/login");
                    }
                  },
                  child: Text(
                    _userController.user.value.id.isNotEmpty ? _userController.user.value.account : '立即登录',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                );
                }),
                ]
              ,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVipCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 197, 153),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Image.asset("lib/assets/ic_user_vip.png", width: 30, height: 30),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                '升级美荟商城会员，尊享无限免邮',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(128, 44, 26, 1),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(126, 43, 26, 1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text('立即开通', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    Widget item(String pic, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            item("lib/assets/ic_user_collect.png", '我的收藏'),
            item("lib/assets/ic_user_history.png", '我的足迹'),
            item("lib/assets/ic_user_unevaluated.png", '我的客服'),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderModule() {
    Widget orderItem(String pic, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),

          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '我的订单',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  orderItem("lib/assets/ic_user_order.png", '全部订单'),
                  orderItem("lib/assets/ic_user_obligation.png", '待付款'),
                  orderItem("lib/assets/ic_user_unreceived.png", '待发货'),
                  orderItem("lib/assets/ic_user_unshipped.png", '待收货'),
                  orderItem("lib/assets/ic_user_unevaluated.png", '待评价'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<GoodDetailItem> _list = [];
  Map<String, dynamic> _params = { "page": 1, "pageSize": 10,};
  @override
  void initState() {
    super.initState();
    _getGuessList();
    _registerScrollListener();
  }
 void _registerScrollListener(){
    _scrollController.addListener((){
      if(_scrollController.position.pixels >= (_scrollController.position.maxScrollExtent -50)){
        _getGuessList();
      }
    });
  }

  bool _isLoading = false;
  bool _hasMore = true;
  void _getGuessList() async{
    if(_isLoading || !_hasMore){
      return;
    }
    _isLoading = true;
    final res = await getGuessListAPI(_params);
    print(res.items.length);
    _isLoading = false;

    // ===== mounted 是什么？=====
    // State 有个内置变量 mounted，表示"这个 State 对应的页面还活着"
    // await 回来后，用户可能已经切走页面了，State 被销毁了
    // 如果这时还调 setState，就会崩溃
    // 所以 await 之后第一句必须检查：
    if (!mounted) return;

    if(res.items.length == 0){
      _hasMore = false;
      return;
    }
    _list.addAll(res.items);
    setState(() {});
    _params["page"]++;
  }
  
  final ScrollController _scrollController = ScrollController();

  // ===== dispose 是什么？=====
  // initState 是页面出生时调用，dispose 就是页面死亡时调用
  // ScrollController 有自己的内部状态和监听，页面销毁时必须释放
  // 不然就内存泄漏 + 滚动事件还在触发（页面都没了监听还活着）
  @override
  void dispose() {
    // 释放 controller 就够了，controller 销毁后监听自动失效
    // 不用单独 removeListener（而且匿名函数还移除不掉）
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(child: _buildHeader()),
        SliverToBoxAdapter(child: _buildVipCard()),
        SliverToBoxAdapter(child: _buildQuickActions()),
        SliverToBoxAdapter(child: _buildOrderModule()),
        // 猜你喜欢 
        SliverPersistentHeader(
          delegate: HmGuess(),
          pinned: true,
        ),
        HmMoreList(recommendList: _list),
      ],
    );
  }
}
