import 'package:flutter/material.dart';
import 'add_course_page.dart';
import 'course_page_list.dart';



class course9thhome extends StatefulWidget {
  course9thhome({Key? key}) : super(key: key);

  @override
  _course9thhomeState createState() => _course9thhomeState();
}

class _course9thhomeState extends State<course9thhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Student'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Add9thCoursePage(),
                  ),
                )
              },
              child: Text('Add student', style: TextStyle(fontSize: 10.0)),
              style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
            )
          ],
        ),
      ),
      body: List9thCoursePage(),
    );
  }
}