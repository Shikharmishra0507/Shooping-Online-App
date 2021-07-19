import 'package:flutter/material.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import './cartTile.dart';
import '../providers/orders.dart';
class CartScreen extends StatelessWidget {
  static final String route='/cartScreen';

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar:AppBar(title: Text("your cart"),) ,
      body:Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child:Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("title",style:TextStyle(fontSize: 20)),
                  Chip(
                    label:Text(cart.totalAmount.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20)),
                    backgroundColor: Theme.of(context).accentColor,),
                  TextButton(onPressed: (){
                    Provider.of<Orders>(context,listen: false).
                    addOrders(cart.totalAmount,cart.getCart.values.toList() );
                    cart.Clear();
                  }, child: Text("Order Now"),)
                ],

              ),
            )
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.getCart.length,
                itemBuilder: (ctx,i)=>CartTile(
                  productId:cart.getCart.keys.toList()[i],
                  id:cart.getCart.values.toList()[i].id,
                  title: cart.getCart.values.toList()[i].title,
                  quantity: cart.getCart.values.toList()[i].amount,
                  price:cart.getCart.values.toList()[i].price
                )),
          )
        ],
      )

    );
  }
}
