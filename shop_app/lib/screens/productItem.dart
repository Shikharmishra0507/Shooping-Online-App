import 'package:flutter/material.dart';
import 'package:shopapp/screens/productDetailScreen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
class ProductItem extends StatelessWidget {
  @override
  final String title;
  final String imageUrl;
  final String id;
  ProductItem({this.imageUrl,this.title,this.id});
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context);
    final cart=Provider.of<Cart>(context,listen: false);
    return GridTile(
      child:GestureDetector(
        onTap:(){
          Navigator.of(context).pushNamed(ProductDetailScreen.route,
              arguments: id);
        },
          child:Image.network(imageUrl)
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black26,
        leading:IconButton(onPressed:product.toggleFavoritevalue ,
          icon: Icon(product.isFavourite==true ?Icons.favorite :Icons.favorite_border),),
        title: Text(title,textAlign:TextAlign.center,),
      trailing: IconButton(onPressed: (){
        cart.addCart(product.id, product.price, product.title);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("items added to cart"),
          duration:Duration(seconds: 1),
          action:SnackBarAction(label:'UNDO',onPressed: (){
            cart.checkRemoveCart(product.id);
          },)
        ),);
      },
          icon:Icon(Icons.add_shopping_cart)),),

    );
  }
}
