import 'package:flutter/material.dart';
import 'package:tasbeeh_counter_app/screen2.dart';
import 'package:tasbeeh_counter_app/screen3.dart';
import 'package:tasbeeh_counter_app/screen4.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasbeeh Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    )
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:const Color(0xFFEFEFEF),
      appBar: AppBar(
          title: Center(
            child: Text(
    ('Tasbeeh Counter App'),
    ),
          ),
      ),

      body: Center(
        child:Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
           child: SizedBox(
             width: double.infinity,
            child: FlatButton(
            color: Colors.teal,
            textColor: Colors.white,
            onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2())
            );
            },
            child: Text('Create Tasbeeh',
                style: TextStyle(fontSize: 22),),
            padding: EdgeInsets.all(33),
        )),),

         Container(
             margin: EdgeInsets.all(8),
              child: SizedBox(
               width: double.infinity,
                 child: FlatButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen3()));
            },
                 child: Text('Counter Tasbeeh',
              style: TextStyle(fontSize: 22),),
            padding: EdgeInsets.all(27),
          )),),

      Container(

            margin: EdgeInsets.all(8),
            child: SizedBox(
            width: double.infinity,
            child: FlatButton(
            color: Colors.teal,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen4()));
            },
            child: Text('View all Tasbeeh',
              style: TextStyle(fontSize: 22),),
            padding: EdgeInsets.all(30),
         )),),

          ],
      ),

    ),
    );


  }
}


