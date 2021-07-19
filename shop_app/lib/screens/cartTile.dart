import 'package:flutter/material.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
class CartTile extends StatelessWidget {
  @override
  final String productId;
  final String id;
  final int quantity;
  final String title;
  final double price;
  CartTile({this.id ,this.price,this.title,this.quantity,this.productId});
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
        return showDialog(context: context, builder:(ctx)=>AlertDialog(title:
        Text("Are you sure "),
        content: Text("do you want to delete?"),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(ctx).pop(true);
          }, child: Text("yes"),),
          FlatButton(onPressed: (){
            Navigator.of(ctx).pop(false);
          }, child: Text("No"))
        ],),
        );
      },
      onDismissed:(direction){
        Provider.of<Cart>(context,listen: false).removeCart(productId);
      } ,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: FittedBox(fit: BoxFit.cover, child: CircleAvatar(child: Text("Rs " +price.toString()),)),
            title: Text(title),
            trailing: Text("x" + quantity.toString()),

          ),
        ),
      ),
    );
  }
}
