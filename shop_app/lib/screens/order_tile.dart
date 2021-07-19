import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';
class OrderTile extends StatefulWidget {
  final ord.OrderItem order;
  OrderTile(this.order);

  @override
  _OrderTileState createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  bool expanded=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child:Column(
        children: [
          ListTile(title:Text(widget.order.price.toString()),
          subtitle: Text(DateFormat('dd MM yyyy hh::mm').format(widget.order.dateTime)),
          trailing: IconButton(
            onPressed: (){
              setState(() {
                expanded=!expanded;
              });
            },
            icon: Icon(expanded==true ? Icons.expand_less:Icons.expand_more),),),
         if(expanded)Container(
           height:min(widget.order.products.length*20.0+100,200),
           child:ListView(children:widget.order.products.map((prod)=>Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Text(prod.title,style:TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.bold
               )),
               Text("Rs "+prod.price.toString()+"  x"+prod.amount.toString()),
             ],
           )).toList())
         ),
        ],

      )
    );
  }
}
