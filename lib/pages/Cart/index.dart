import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
 CartView({Key? key}) : super(key: key);

  @override
   CartViewState createState() =>  CartViewState();
}

class  CartViewState extends State <CartView> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text("购物车"),
    );
  }
}