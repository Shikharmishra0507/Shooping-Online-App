import 'package:flutter/material.dart';
import 'package:shopapp/orders_screen.dart';
class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(child:Text("head Drawer"),),
          Divider(),
          ListTile(onTap:(){
            Navigator.of(context).pushNamed("/");
          } ,leading:Icon(Icons.shop),
          title: Text("shop"),),
          Divider(),
          ListTile(onTap:(){
            Navigator.of(context).pushNamed(OrdersScreen.route);
          },leading: Icon(Icons.payment),
          title: Text("Orders"),)
        ],
      ),
    );
  }
}
