import 'package:flutter/material.dart';
import'package:provider/provider.dart';
import './providers/orders.dart';
import './screens/order_tile.dart';
class OrdersScreen extends StatelessWidget {
  static final String route="/orders_screen";
  @override
  Widget build(BuildContext context) {
    final order=Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title:Text("Your orders")),
      body:ListView.builder(
        itemCount: order.ordersList.length,
        itemBuilder: (ctx,index)=>OrderTile(
          order.ordersList[index]
        ),
      )
    );
  }
}
