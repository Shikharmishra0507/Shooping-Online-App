import 'package:flutter/material.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'productItem.dart';
class ProductGrid extends StatelessWidget {
  @override
  bool selectedFavourite;
  ProductGrid(this.selectedFavourite);
  Widget build(BuildContext context) {
    final productData=Provider.of<ProductsProvider>(context);
    final products=selectedFavourite==true ?
    productData.favoriteListItems:productData.listItems;
    return GridView.builder(
        itemCount: products.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,

        ) ,
        itemBuilder:(BuildContext ctx,int index)=>ChangeNotifierProvider.value(
            value:products[index],
        child: ProductItem(title:products[index].title,
            imageUrl: products[index].imageUrl,
            id:products[index].id))
    );
  }
}
