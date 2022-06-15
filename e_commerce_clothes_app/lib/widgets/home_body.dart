
import 'package:flutter/cupertino.dart';

import 'all_products.dart';
import 'category.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: <Widget>[
        SizedBox(height: 10,),

        Center (child: Text('Categories', style: TextStyle(fontSize:
        20,fontWeight: FontWeight.bold),)),
        SizedBox(height: 10,),
        Category(),


        Center(child: Text('Products', style: TextStyle(fontSize:
        20,fontWeight: FontWeight.bold),)),
        AllProducts(),
      ],
    );
  }
}
