import 'package:flutter/material.dart';

void main() {
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
      home: const MyHomePage(title: 'Tasbeeh Counter App'),
      debugShowCheckedModeBanner: false,
    );
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
           child: FlatButton(
            color: Colors.teal,
            textColor: Colors.white,
            onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen2()));
            },
            child: Text('Create Tasbeeh',
                style: TextStyle(fontSize: 22),),
            padding: EdgeInsets.all(33),
        )),

         Container(
             margin: EdgeInsets.all(8),
          child: FlatButton(
            color: Colors.teal,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen3()));
            },
            child: Text('Counter Tasbeeh',
              style: TextStyle(fontSize: 22),),
            padding: EdgeInsets.all(27),
          )),

      Container(
          margin: EdgeInsets.all(8),
         child: FlatButton(
            color: Colors.teal,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Screen4()));
            },
            child: Text('View all Tasbeeh',
              style: TextStyle(fontSize: 22),),
            padding: EdgeInsets.all(30),
         )),

          ],
      ),

    ),
    );


  }
}

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
        child: FlatButton(
          color: Colors.blueAccent,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
          },
          child: Text('GO TO HOME'),
        ),
      ),
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}
class _Screen3State extends State<Screen3> {
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
        child: FlatButton(
          color: Colors.blueAccent,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
          },
          child: Text('HOME'),
        ),
      ),
    );
  }
}

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}
class _Screen4State extends State<Screen4> {
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
        child: FlatButton(
          color: Colors.blueAccent,
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
          },
          child: Text('Back TO HOME'),
        ),
      ),
    );
  }
}