import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products_provider.dart';
class UserProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productdata=Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("your products"),
        actions: [
          IconButton(icon: Icon(Icons.add),
          onPressed: (){},)
        ],
      ),

    );
  }
}
