import 'package:flutter/material.dart';
import 'main.dart';

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}
class _Screen4State extends State<Screen4> {
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
          color: Colors.blueAccent,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
          },
          child: Text('Back TO HOME'),
        ),
      ),
    );
  }
}