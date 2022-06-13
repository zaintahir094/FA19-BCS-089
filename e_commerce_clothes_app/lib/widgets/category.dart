import 'package:e_commerce_clothes_app/widgets/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';


class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
          children: <Widget>[
            CategoryCard(
              Icon(Icons.book,size: 40,),
              "Books",
            ),
            CategoryCard(
              Icon(Icons.laptop,size: 40,),
              "Laptops",
            ),
            CategoryCard(
              Icon(Icons.videogame_asset,size: 40,),
              "Games",
            ),
            CategoryCard(
              Icon(Icons.movie,size: 40,),
              "Movies",
            ),
            CategoryCard(
              Icon(Icons.watch,size: 40,),
              "Watches",
            ),
            CategoryCard(
              Icon(Icons.weekend,size: 40,),
              "Suit",
            )

        ],
      ),
    );
  }
}
