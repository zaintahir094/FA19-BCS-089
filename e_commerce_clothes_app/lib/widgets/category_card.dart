import 'package:flutter/cupertino.dart';

class CategoryCard extends StatelessWidget {

final Icon icon;
final String name;
CategoryCard (this.icon,this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          icon,
          Text(name)
        ],
      ),
    );
  }
}
