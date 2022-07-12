import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
    body: Center(
     child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [

         Container(
           margin: const EdgeInsets.all(5),
           child: ElevatedButton.icon(
               onPressed: () {},
               icon: Icon(Icons.account_circle),
               label: Text('Admin'),
           style: ElevatedButton.styleFrom(
               primary: Colors.amber,
             textStyle: TextStyle(
               fontSize: 22,
                 fontWeight: FontWeight.bold,


             ),
           ),
           )),

         Container(
             margin: const EdgeInsets.all(5),
             child: ElevatedButton.icon(
               onPressed: () {},
               icon: Icon(Icons.account_circle),
               label: Text('Teacher'),
               style: ElevatedButton.styleFrom(
                 primary: Colors.amber,
                 textStyle: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                   fontSize: 22,
                 ),
               ),
             )),

         Container(
             margin: const EdgeInsets.all(5),
             child: ElevatedButton.icon(
               onPressed: () {},
               icon: Icon(Icons.account_circle),
               label: Text('Student'),
               style: ElevatedButton.styleFrom(
                 primary: Colors.amber,
                 textStyle: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 22,
                 ),
               ),
             )),

       ],))));
  }
}
