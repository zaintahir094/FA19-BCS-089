
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_clothes_app/models/products.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
static const routeName = '/Product-detail';

  DetailPage({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context)?.settings.arguments as
    String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
      title: Text(loadedPdt.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
              width: double.infinity,
            child: Padding(padding:
            const EdgeInsets.all(10),
            child: Image.network(loadedPdt.imgUrl),
          ),
          ),
          Text('Price\$${loadedPdt.price}',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text('${loadedPdt.description}',
          style: TextStyle(
            fontSize: 30,
          ),),
      )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,child: Icon(Icons.shopping_cart, size: 30,),),
    );
  }
}
