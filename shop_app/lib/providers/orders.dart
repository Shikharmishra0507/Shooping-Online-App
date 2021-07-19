import 'package:flutter/material.dart';
import 'package:shopapp/providers/cart.dart';
class OrderItem{
  final String id;
  final double price;
  final List<CartItem>products;
  final DateTime dateTime;
  OrderItem({@required this.id,@required this.price,@required this.products,@required this.dateTime});
}
class Orders with ChangeNotifier{
  List<OrderItem>_orders=[];
  List<OrderItem>get ordersList{
    return [..._orders];
  }
  void addOrders(double amount,List<CartItem>products){
    _orders.insert(0, OrderItem(id: DateTime.now().toString(),
        price: amount, products: products, dateTime: DateTime.now()));
    notifyListeners();
  }

}