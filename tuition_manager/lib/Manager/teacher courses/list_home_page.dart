import 'package:flutter/material.dart';
import 'package:tuition_manager/Manager/teacher courses//add_course_page.dart';
import 'package:tuition_manager/Manager/teacher courses//course_page_list.dart';




class course10thhome extends StatefulWidget {
  course10thhome({Key? key}) : super(key: key);

  @override
  _course10thhomeState createState() => _course10thhomeState();
}

class _course10thhomeState extends State<course10thhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Teacher'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCourse10thPage(),
                  ),
                )
              },
              child: Text('Add Teacher', style: TextStyle(fontSize: 10.0)),
              style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
            )
          ],
        ),
      ),
      body: ListCourse10thPage(),
    );
  }
}