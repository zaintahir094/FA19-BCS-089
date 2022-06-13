
import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{
   final String id;
   final String category;
   final String name;
   final String description;
   final String imgUrl;
   final double price;

  Product({required this.id,required this.category,required this.name,required
  this.description,required this.imgUrl,required this.price});
    }
class Products  with ChangeNotifier{
  List<Product>_items=[
    Product(
      id: '1',
      name: "Art of the deal",
      imgUrl: '',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',


    ),
    Product(
      id: '2',
      name: "Zain",
      imgUrl: '',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',
    ),
    Product(
      id: '3',
      name: "Hamza",
      imgUrl: '',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',
    ),
    Product(
      id: '4',
      name: "Burhan",
      imgUrl: '',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',
    ),
    Product(
      id: '5',
      name: "Moez",
      imgUrl: '',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',
    ),

  ];
  List<Product>get items{
    return[..._items];
  }
}