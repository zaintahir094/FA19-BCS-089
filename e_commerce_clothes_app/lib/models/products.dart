
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
class Products with ChangeNotifier{
  List<Product>_items=[
    Product(
      id: '1',
      name: "Art of the deal",
      imgUrl: 'https://static-01.daraz.pk/p/53c624dcaec8d4b45486f9442fb729dd.jpg',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',


    ),
    Product(
      id: '2',
      name: "Zain",
      imgUrl: 'https://static-01.daraz.pk/p/e26cdc7a43e9b0fa15cc6b38aca9aa25.jpg',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',
    ),
    Product(
      id: '3',
      name: "Hamza",
      imgUrl: 'https://static-01.daraz.pk/p/d69c0563fdd7d68ea3f43a350bcf3861.jpg',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',
    ),
    Product(
      id: '4',
      name: "Burhan",
      imgUrl: 'https://static-01.daraz.pk/p/f7f95c741b2bb7ec02a9cd7bac71b64e.jpg',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',
    ),
    Product(
      id: '5',
      name: "Moez",
      imgUrl: 'https://static-01.daraz.pk/p/0ad596d62763538f75d96bb7ac73377b.jpg',
      category: 'Buisness',
      price: 50,
      description: 'Write the whole description in Products.dart',
    ),

    Product(
      id: '6',
      name: "Massab",
       imgUrl: 'https://static-01.daraz.pk/p/1765018f0aa052f3dec2c1dc0e4138f5.jpg',
      category: 'Buisness',
      price: 90,
      description: 'Write the whole description in Products.dart',
    ),

  ];
  List<Product>get items{
    return[..._items];
  }

  get id => null;
  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}