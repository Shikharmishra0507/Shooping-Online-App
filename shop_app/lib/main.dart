import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/orders_screen.dart';
import 'package:shopapp/providers/orders.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'screens/sideBar.dart';
import 'screens/product_overview_screen.dart';
import 'screens/productDetailScreen.dart';
import './providers/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_)=>Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "shop App",
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.orange,),
        initialRoute: '/',
        routes: {
          '/': (ctx) => productOverviewScreen(),
          ProductDetailScreen.route: (_) => ProductDetailScreen(),
          CartScreen.route:(_)=>CartScreen(),
          OrdersScreen.route:(_)=>OrdersScreen(),
        },
      ),
    );
  }
}
