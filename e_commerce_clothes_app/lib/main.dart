import 'package:flutter/material.dart';
import 'package:e_commerce_clothes_app/screens/homepage.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value()
      ];
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce App',
        theme: ThemeData(
          primaryColor: Colors.teal,
          accentColor: Colors.white,

        ),
        home: HomePage(),
      ),
    );
  }
}

