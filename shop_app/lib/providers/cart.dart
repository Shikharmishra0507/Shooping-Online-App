import 'package:flutter/material.dart';
class CartItem{
  String id;
  String title;
  double price;
  int amount;
  CartItem({ @required this.id,
  @required this.title,
  @required this.amount,
  @required this.price,});

}
class Cart with ChangeNotifier{
  Map<String,CartItem>_items={};

  Map<String,CartItem> get getCart{
    return {..._items};
  }
  double get totalAmount{
    var total=0.0;
    _items.forEach((key, cartItem) {
      total+=cartItem.price*cartItem.amount;
    });

    print(total);
    return total;
  }
  void checkRemoveCart(String productId){
    if(!_items.containsKey(productId)){
      return ;
    }
    if(_items[productId].amount>1){
      _items.update(productId, (value) => CartItem(id: value.id,
          title:value.title, amount: value.amount-1, price: value.price));
    }
    else{
      _items.remove(productId);
    }
  }
  void  removeCart(String productId){
      _items.remove(productId);
      notifyListeners();
  }
  void Clear() {
    _items = {};
    notifyListeners();
  }
  void addCart(String productId,double price,String title){
    if(_items.containsKey(productId)){
        _items.update(productId, (prev) => CartItem(
          id:prev.id,
          title:prev.title,
          amount:prev.amount+1,
          price:prev.price
        ));
    }
    else{
      _items.putIfAbsent(productId, () =>
        CartItem(
          title: title,
          price: price,
          id:DateTime.now().toString(),
          amount: 1
        )
      );
    }
    notifyListeners();
  }
}