import 'package:e_commerce_clothes_app/models/products.dart';
import 'package:e_commerce_clothes_app/screens/pdt_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PdtItems extends StatelessWidget {
final String name;
final String imageUrl;
PdtItems({required this.name,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final pdt = Provider.of<Products>(context);

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
            IconButton(icon: Icon(Icons.shopping_cart),onPressed: null,
            ),
            backgroundColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}

