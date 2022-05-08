import 'package:flutter/material.dart';

import 'main.dart';

class create extends StatefulWidget {
  @override
  _createState createState() => _createState();
}
class _createState extends State<create> {
  @override

  var counter = 0;
  tasbeehcounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Color(0xFF2e1f1f),
      appBar: AppBar(
        backgroundColor: Color(0xFF9c172b),
        title: Text("Tasbeeh Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                tasbeehcounter();
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: Colors.amber, spreadRadius: 10)
                    ],
                  ),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.4,
                    backgroundColor: Colors.black,
                    child: Center(
                      child: Text(
                        "$counter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 60),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black, spreadRadius: 5)
                  ],
                ),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.2,
                  backgroundColor: Color(0xFFf70202),
                  child: Center(
                    child: Text(
                      "Reset",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
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

