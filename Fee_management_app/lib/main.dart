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

        backgroundColor:const Color(0xFFEFEFEF),
        appBar: AppBar(
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
                  children: [
                    Positioned(
                      bottom: 8.0,
                      left: 4.0,
                      child: Text(
                        "FA19-BCS-089",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  image: DecorationImage(
                    image: NetworkImage(
                      "",
                    ),
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
             ),),
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
