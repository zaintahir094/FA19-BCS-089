import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:splashscreen/splashscreen.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Container(
              // margin: new EdgeInsets.fromLTRB(0, 55, 0, 0),

              child: Center(
                  child: Column(
                    children: <Widget>[
                      ImageIcon(
                        AssetImage("images/iimg.jpg"),
                        color: Colors.red,
                        size: 2,
                      ),


                      SizedBox(

                        width: double.infinity,
                        height: 80,
                        child: FlatButton(
                            color: Colors.orange,
                            onPressed: () {
                              final player = AudioCache();
                              player.play('note1.wav.wav');
                            },
                            child: (Text(''))),
                      ),



                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: FlatButton(
                            color: Colors.yellowAccent,
                            onPressed: () {
                              final player = AudioCache();
                              player.play('note2.wav.wav');
                            },
                            child: (Text(''))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: FlatButton(
                            color: Colors.blue,
                            onPressed: () {
                              final player = AudioCache();
                              player.play('note3.wav.wav');
                            },
                            child: (Text(''))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: FlatButton(
                            color: Colors.lightGreen,
                            onPressed: () {
                              final player = AudioCache();
                              player.play('note4.wav.wav');
                            },
                            child: (Text(''))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: FlatButton(
                            color: Colors.pink,
                            onPressed: () {
                              final player = AudioCache();
                              player.play('note5.wav.wav');
                            },
                            child: (Text(''))),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: FlatButton(
                            color: Colors.deepPurple,
                            onPressed: () {
                              final player = AudioCache();
                              player.play('note6.wav.wav');
                            },
                            child: (Text(''))),
                      ),
                      SizedBox(
                        width:double.infinity,
                        height: 80,
                        child: FlatButton(
                            color: Colors.red,
                            onPressed: () {
                              final player = AudioCache();
                              player.play('note7.wav.wav');
                            },
                            child: (Text(''))),
                      ),
                    ],
                  )),
            )
        ),
      ),
    );
  }


}