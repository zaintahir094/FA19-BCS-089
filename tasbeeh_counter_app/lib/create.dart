import 'package:flutter/material.dart';

import 'main.dart';

class create extends StatefulWidget {
  @override
  _createState createState() => _createState();
}
class _createState extends State<create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            ('Tasbeeh Counter App'),
          ),
        ),

      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
          },
          child: Text(''),
        ),
      ),
    );
  }
}