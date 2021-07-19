import 'package:flutter/material.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:provider/provider.dart';
class ProductDetailScreen extends StatelessWidget {
  @override
  static const String route='/productDetailScreen';

  Widget build(BuildContext context) {
   final String productId=ModalRoute.of(context).settings.arguments as String;
   final product=Provider.of<ProductsProvider>(context).listItems.firstWhere((prod) => prod.id==productId);
   return Scaffold(

        body: SingleChildScrollView(

          child: Column(

            children: [
              Container(
                height:300,
                child:Image.network(product.imageUrl,fit: BoxFit.fitHeight,),

                width: double.infinity,
              ),
              SizedBox(height: 8,),
              Text(product.title,style:TextStyle(fontSize: 20,color: Colors.grey)),
              SizedBox(height:8),
              Text(product.price.toString()),
            ],

          ),
        ),
    );
  }
}
