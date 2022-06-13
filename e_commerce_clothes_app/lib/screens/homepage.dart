import 'package:e_commerce_clothes_app/widgets/category_card.dart';
import 'package:e_commerce_clothes_app/widgets/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Flutter E-commerce'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Text('Categories', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         SizedBox(height: 10,),
         Category(),
          Text('Products', style: TextStyle(fontSize: 40),),
         // AllProducts(),
        ],
      ),

    );
  }
}
