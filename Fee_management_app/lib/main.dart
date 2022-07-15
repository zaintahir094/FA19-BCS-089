import 'package:fee_management_app/screens/student_login.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.black54,
            toolbarHeight: 80,
          title: Center(
            child: Text(
              ('Fee Management System '),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Stack(
                  children: const [
                    Positioned(
                      bottom: 8.0,
                      left: 4.0,
                      child: Text(
                        "FA19-BCS-089",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,
                width: 1,
                  ),
                  color: Colors.amber,
                  image: DecorationImage(
                    image: NetworkImage(
                      "",),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Zain Tahir"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.mail),
                title: Text("zainch5094@gmail.com"),
                onTap: () {},
              ),
            ],
          ),
        ),

    body: Center(
     child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [

         Container(

             width:1450,
             height: 80,
           margin: const EdgeInsets.all(20),
           child: ElevatedButton.icon(
               onPressed: () {},
               icon: Icon(Icons.account_circle),
               label: Text('Admin'),
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
               onPressed: () {},
               icon: Icon(Icons.account_circle),
               label: Text('Teacher'),
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
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => studlog()),
                 );
               },
               icon: Icon(Icons.account_circle),
               label: Text('Student'),
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

       ],))));
  }
}
