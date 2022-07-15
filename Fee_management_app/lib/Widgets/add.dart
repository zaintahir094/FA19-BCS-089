import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _add();
}

class _add extends State<add> {
  @override
  Widget build (BuildContext context) {
    Widget myAppBarIcon(){
      return Container(
        width: 30,
        height: 30,
        child: Stack(
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            ),
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffc32c37),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      _counter.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
