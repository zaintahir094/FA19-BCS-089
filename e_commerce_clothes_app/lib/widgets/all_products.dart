import 'package:e_commerce_clothes_app/models/products.dart';
import 'package:e_commerce_clothes_app/widgets/pdt_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 class AllProducts extends StatelessWidget {


   @override
   Widget build(BuildContext context) {
     final productData=Provider.of<Products>(context);
     final pdts=productData.items;
     return GridView.builder(
     physics: ScrollPhysics(),
       shrinkWrap: true,

       itemCount: pdts.length,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
         (crossAxisCount: 2),
       itemBuilder: (ctx,i)=>ChangeNotifierProvider.value(value: pdts
       [i],
      child: PdtItems(name: pdts[i].name, imageUrl: pdts[i].imgUrl), ),

     );
   }
 }

