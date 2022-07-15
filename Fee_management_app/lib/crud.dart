import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class crud extends StatefulWidget {
  const crud({Key? key}) : super(key: key);

  @override
  State<crud> createState() => _crudState();
}

class _crudState extends State<crud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
                width:1450,
                height: 80,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>add())
                    );
                  },
                  icon: Icon(Icons.account_circle),
                  label: Text('ADD'),
                  style: ElevatedButton.styleFrom( side: BorderSide(width:2, color:Colors.black), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),

                    primary: Colors.amber,
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                )),

            Container(
                width:1450,
                height: 80,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>update())
                    );
                  },
                  icon: Icon(Icons.account_circle),
                  label: Text('UPDATE'),
                  style: ElevatedButton.styleFrom( side: BorderSide(width:2, color:Colors.black), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),

                    primary: Colors.amber,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                )),

            Container(
                width:1450,
                height: 80,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>delete())
                    );
                  },

                  icon: Icon(Icons.account_circle),
                  label: Text('DELETE'),
                  style: ElevatedButton.styleFrom( side: BorderSide(width:2, color:Colors.black), //border width and color
                    elevation: 3, //elevation of button
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(30)
                    ),
                    primary: Colors.amber,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                )),

          ],)));
  }
}


