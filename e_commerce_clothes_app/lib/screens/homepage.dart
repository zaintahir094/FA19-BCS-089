import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Text('Categories', style: TextStyle(fontSize: 40),),
         //Categories(),
          Text('Products', style: TextStyle(fontSize: 40),),
          //Allproducts(),
        ],
      ),

    );
  }
}
