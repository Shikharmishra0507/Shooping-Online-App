import 'package:flutter/material.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/productItem.dart';
import 'package:shopapp/screens/productsGrid.dart';
import 'package:shopapp/screens/sideBar.dart';
import '../providers/product.dart';
enum PopupValues{
    All,
    Favourite,
}
class productOverviewScreen extends StatefulWidget {
  @override
  _productOverviewScreenState createState() => _productOverviewScreenState();
}

class _productOverviewScreenState extends State<productOverviewScreen> {
  @override
  bool selectedFavourite=false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome to shop"),
        actions: [
          PopupMenuButton(
            onSelected: (PopupValues result){
              setState(() {
                if(result==PopupValues.Favourite){
                  selectedFavourite=true;
                }
                else {
                  selectedFavourite=false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_)=>[
              PopupMenuItem(child: Text("All values"),value: PopupValues.All,),
              PopupMenuItem(child: Text("Favourite"),value:PopupValues.Favourite),

            ],
          ),
          IconButton(
          onPressed: (){
            Navigator.of(context).pushNamed(CartScreen.route);
          },
              icon:Icon(Icons.shopping_cart))
        ],

      ),
      drawer: SideBar(),
      body:ProductGrid(selectedFavourite));
  }
}
