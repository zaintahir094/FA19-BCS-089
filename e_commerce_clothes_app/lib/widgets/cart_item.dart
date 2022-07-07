
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
class CartPdt extends StatelessWidget {

  final String id;
final String productId;
final double price;
final int quantity;
final String name;

CartPdt(this.id,this.productId,this.price,this.quantity,this.name);
  @override
  Widget build(BuildContext context) {
    final cart= Provider.of<Cart>(context);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(
            child: Text('\$$price')
          ),
        ),
        title: Text(name),
        subtitle: Text('Total:\$${(price*quantity)}'),
        trailing: Text('$quantity x'),
      ),
    );
  }
}
