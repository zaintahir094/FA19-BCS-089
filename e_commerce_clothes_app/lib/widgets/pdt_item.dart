import 'package:e_commerce_clothes_app/models/products.dart';
import 'package:e_commerce_clothes_app/screens/pdt_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_clothes_app/widgets/cart_item.dart';
import '../models/cart.dart';


class PdtItems extends StatelessWidget {
final String name;
final String imageUrl;
PdtItems({required this.name,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Products>(context);
    final cart = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailPage.routeName, arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
            child: Image.network(imageUrl),
          footer: GridTileBar(
            title: Text(name),
            trailing:
            IconButton(icon: Icon(Icons.shopping_cart),
              onPressed:(){

              }
            ),
            backgroundColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}

