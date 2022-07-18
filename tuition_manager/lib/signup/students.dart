import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/auth.dart';
import '../services/text_field.dart';


class Studentsignup extends StatefulWidget {
  @override
  _StudentsignupState createState() => _StudentsignupState();
}

class _StudentsignupState extends State<Studentsignup> {

  TextEditingController usernameEditingController =
  new TextEditingController();
  TextEditingController useraddressEditingController =
  new TextEditingController();
  TextEditingController useremailEditingController =
  new TextEditingController();
  TextEditingController userpasswordEditingController =
  new TextEditingController();
  TextEditingController userphonenumberEditingController =
  new TextEditingController();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  // Add Student
  addStudent() async {
    try {
      if (formKey.currentState!.validate()) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Row(
                  children: [
                    new CircularProgressIndicator(),
                    SizedBox(
                      width: 25.0,
                    ),
                    new Text("Loading, Please wait"),
                  ],
                ),
              ),
            );
          },
        );
        await AuthService()
            .signUpWithEmailandPassword(
            useremailEditingController.text,
            userpasswordEditingController.text,
            usernameEditingController.text,
            useraddressEditingController.text,
            userphonenumberEditingController.text,
            'student')
            .then((value) {
          if (value != null) {
            value.sendEmailVerification().then((value) async {
             final FirebaseFirestore _user = FirebaseFirestore.instance;
             await _user
                  .collection("Status")
                  .doc('text')
                  .set({"status": 'No Data'});
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Studentsignup(),
                ),
              );
              Fluttertoast.showToast(
                  msg: "Signup Sucessfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });
          } else {
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "Student has already registered",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.red,
                fontSize: 16.0);
          }
        }).catchError((e) {
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: e.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 14.0);
          print(e.toString());
        });
      }
    } catch (e) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Student Signup'),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: usernameEditingController,
                            validator: (val) {
                              return val!.isEmpty || val.length < 3
                                  ? "Enter Name 3+ characters"
                                  : null;
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        //SizedBox(height: 8.0),
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: useraddressEditingController,
                            // style: TextStyle(color: Colors.black, fontSize: 16),
                            validator: (val) {
                              return val!.isEmpty || val.length < 2
                                  ? "Enter Name 3+ characters"
                                  : null;
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Address',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        //SizedBox(height: 8.0),
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                            controller: useremailEditingController,
                            //style: TextStyle(color: Colors.black, fontSize: 16),
                            validator: (val) {
                              return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                                  ? null
                                  : "Enter Correct Email";
                            },
                          ),
                        ),
                        //SizedBox(height: 8.0),
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: userphonenumberEditingController,
                            maxLength: 11,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Phone Number',
                              //labelText: 'like sp18-bse-b10-042',
                              border: InputBorder.none,
                            ),
                            //cursorColor: Colors.black26,
                            //controller: userphonenumberEditingController,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            validator: (val) {
                              return val!.length != 11
                                  ? "Phone # be like 03000000000"
                                  : null;
                            },
                          ),
                        ),
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: userpasswordEditingController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.password,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Password',
                              // labelText: 'like sp18-bse-b10-042',
                              border: InputBorder.none,
                            ),

                            style: TextStyle(color: Colors.black, fontSize: 16),
                            validator: (val) {
                              return val!.length < 6
                                  ? "Enter Password 6+ characters"
                                  : null;
                            },
                            obscureText: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: size.width * 0.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              color: Colors.green,
                              onPressed: () {
                                addStudent();
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
