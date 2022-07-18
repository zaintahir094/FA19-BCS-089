import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAcademyPage extends StatefulWidget {
  AddAcademyPage({Key? key}) : super(key: key);

  @override
  _AddAcademyPageState createState() => _AddAcademyPageState();
}

class _AddAcademyPageState extends State<AddAcademyPage> {
  final _formKey = GlobalKey<FormState>();

  var ownname = "";
  var email = "";
  var acadname = "";
  var number = "";
  var location = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final ownnameController = TextEditingController();
  final emailController = TextEditingController();
  final acadnameController = TextEditingController();
  final numberController = TextEditingController();
  final locationController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    ownnameController.dispose();
    emailController.dispose();
    acadnameController.dispose();
    numberController.dispose();
    locationController.dispose();
    super.dispose();
  }

  clearText() {
    ownnameController.clear();
    emailController.clear();
    acadnameController.clear();
    numberController.clear();
    locationController.clear();
  }

  // Adding Student
  CollectionReference academy =
  FirebaseFirestore.instance.collection('Registered Academy');

  Future<void> addUser() {
    return academy
        .add({'ownname': ownname, 'email': email,'acadname': acadname,'number': number,'location': location,})
        .then((value) => print('Academy Registered'))
        .catchError((error) => print('Failed to Registered Academy: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Academy"),
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
                    labelText: 'Owner Name: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: ownnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Owner Name';
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
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
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
                    labelText: 'Academy: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: acadnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Academy Name';
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
                    labelText: 'Number: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: numberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Number';
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
                    labelText: 'Location: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                    TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: locationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Location';
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
                            ownname = ownnameController.text;
                            email = emailController.text;
                            acadname = acadnameController.text;
                            number = numberController.text;
                            location = locationController.text;
                            addUser();
                            clearText();
                          });
                        }
                      },
                      child: Text(
                        'Register',
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