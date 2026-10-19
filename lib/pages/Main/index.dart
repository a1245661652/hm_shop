import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/My/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String,String>> bottomNavigationBarItems = [
    {
      "icon":"lib/assets/ic_public_home_normal.png",
      "active_icon":"lib/assets/ic_public_home_active.png",
      "text":"首页",
    },
    {
      "icon":"lib/assets/ic_public_pro_normal.png",
      "active_icon":"lib/assets/ic_public_pro_active.png",
      "text":"分类",
    },
    {
      "icon":"lib/assets/ic_public_cart_normal.png",
      "active_icon":"lib/assets/ic_public_cart_active.png",
      "text":"购物车",
    },
    {
      "icon":"lib/assets/ic_public_my_normal.png",
      "active_icon":"lib/assets/ic_public_my_active.png",
      "text":"我的",
    },
    
  ];
  int _currentindex = 0;
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(bottomNavigationBarItems.length, (index) {
      return BottomNavigationBarItem(
          icon: Image.asset(
            bottomNavigationBarItems[index]["icon"]!,
            width: 30,
            height: 30,),
          activeIcon: Image.asset(
            bottomNavigationBarItems[index]["active_icon"]!,
            width: 30,
            height: 30,),
          label: bottomNavigationBarItems[index]["text"]!,
      );
    });
  }
  List<Widget> _getChildren(){
    return[
      HomeView(),
      CategoryView(),
      CartView(),
      MyView()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          children: _getChildren(),
          index:_currentindex
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        currentIndex: _currentindex,
        onTap: (int index)  {
            print(index);
            _currentindex = index;
            setState(() {
              
            });
        },
        items: _getTabBarWidget(),
      ),
    );
  }
}