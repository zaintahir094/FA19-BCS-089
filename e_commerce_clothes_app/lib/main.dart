import 'package:e_commerce_clothes_app/models/cart.dart';
import 'package:e_commerce_clothes_app/models/products.dart';
import 'package:e_commerce_clothes_app/screens/pdt_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_clothes_app/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_clothes_app/screens/cart_screen.dart';
void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
          value: Products(),
        ),

        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.white,

        ),
        home: HomePage(),
        routes: {
          DetailPage.routeName: (ctx)=>DetailPage(),
          CartScreen.routeName: (ctx)=>CartScreen(),

        },
      ),
    );
  }
}

