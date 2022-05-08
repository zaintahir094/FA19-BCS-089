import 'package:flutter/material.dart';
import 'create.dart';
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
          TextField(
              autocorrect: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter Tasbeeh Count',
              )),
          Container(
              margin: EdgeInsets.all(8),
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>create()));
                },
                child: Text('create',
                  style: TextStyle(fontSize: 20),),
                padding: EdgeInsets.all(20),
              )),
],
    ),
    ),
    );
  }
}
