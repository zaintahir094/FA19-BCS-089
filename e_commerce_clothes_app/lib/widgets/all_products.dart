import 'package:e_commerce_clothes_app/models/products.dart';
import 'package:flutter/cupertino.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final pdts=productData.items;
    return GridView.builder(
      physics: ScrollPhysics(),
      itemCount: 1,
    );
  }
}
