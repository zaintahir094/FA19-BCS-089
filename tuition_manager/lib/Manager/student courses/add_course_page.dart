import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add9thCoursePage extends StatefulWidget {
  Add9thCoursePage({Key? key}) : super(key: key);

  @override
  _Add9thCoursePageState createState() => _Add9thCoursePageState();
}

class _Add9thCoursePageState extends State<Add9thCoursePage> {
  final _formKey = GlobalKey<FormState>();

  var classs = "";
  var subject = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final classsController = TextEditingController();
  final subjectController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    classsController.dispose();
    subjectController.dispose();
    super.dispose();
  }

  clearText() {
    classsController.clear();
    subjectController.clear();
  }

  // Adding Student
  CollectionReference students =
  FirebaseFirestore.instance.collection('courses 9th');

  Future<void> addUser() {
    return students
        .add({'classs': classs, 'subject': subject,})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Student"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: classsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Course: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: subjectController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Course Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            classs = classsController.text;
                            subject = subjectController.text;
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Clear',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}