import 'package:flutter/material.dart';
import 'main.dart';



class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
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
        child:Column (children: <Widget>[
           TextField(
              autocorrect: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Type Tasbeeh Name',
              )),
           FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
            },
            child: Text(''),
          ),
],
    ),
    ),
    );
  }
}
