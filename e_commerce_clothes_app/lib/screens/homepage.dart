import 'package:e_commerce_clothes_app/widgets/category_card.dart';
import 'package:e_commerce_clothes_app/widgets/category.dart';
import 'package:e_commerce_clothes_app/widgets/home_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/all_products.dart';
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
      body: HomeBody(),
    );
  }
}
