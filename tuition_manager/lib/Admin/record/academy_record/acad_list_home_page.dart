import 'package:flutter/material.dart';
import '../../../Manager/academy_registration.dart';
import 'academy_page_list.dart';



class Academyhome extends StatefulWidget {
  Academyhome({Key? key}) : super(key: key);

  @override
  _AcademyhomeState createState() => _AcademyhomeState();
}

class _AcademyhomeState extends State<Academyhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Academy',textAlign: TextAlign.center,),


          ],
        ),
      ),
      body: ListAcademyPage(),
    );
  }
}