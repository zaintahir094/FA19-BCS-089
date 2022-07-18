import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../services/database.dart';



class TeacherRecord extends StatefulWidget {
  @override
  _TeacherRecordState createState() => _TeacherRecordState();
}

class _TeacherRecordState extends State<TeacherRecord> {
  // UPdate Delete PopUp
  void detail(BuildContext context, DocumentSnapshot ds) {
    String _Fname = ds['Fname'],
        _Lname = ds['Lname'],
        _email = ds['email'],
        _phoneNumber = ds['phoneNumber'];
    FirebaseFirestore _user = FirebaseFirestore.instance;
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Record of Teacher'),
            content: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: ds['Fname'],
                      cursorColor: Colors.black26,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      validator: (val) {
                        return val!.isEmpty || val.length < 3
                            ? "Enter FirstName 3+ characters"
                            : null;
                      },
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      onChanged: (_val) {
                        setState(() {
                          _Fname = _val;
                        });
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      initialValue: ds['Lname'],
                      cursorColor: Colors.black26,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      validator: (val) {
                        return val!.isEmpty || val.length < 2
                            ? "Enter LastName 3+ characters"
                            : null;
                      },
                      onChanged: (_val) {
                        setState(() {
                          _Lname = _val;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: 'Last Name',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      initialValue: ds['email'],
                      cursorColor: Colors.black26,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      onChanged: (_val) {
                        setState(() {
                          _email = _val;
                        });
                      },
                      validator: (val) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                            ? null
                            : "Enter Correct Email";
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      initialValue: ds['phoneNumber'],
                      onChanged: (_val) {
                        setState(() {
                          _phoneNumber = _val;
                        });
                      },
                      cursorColor: Colors.black26,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      validator: (val) {
                        return val!.length < 11
                            ? "Phone # be like 03000000000"
                            : null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
            actions: [
              RaisedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
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
                    await _user.collection('AddTeacher').doc(ds.id).update({
                      'Fname': _Fname,
                      'Lname': _Lname,
                      'email': _email,
                      'phoneNumber': _phoneNumber,
                      'role': 'teacher',
                      'time': DateTime.now()
                    }).then((value) {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TeacherRecord(),
                        ),
                      );
                      Fluttertoast.showToast(
                          msg: "Record Update Successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  }
                },
                child: Text('Update'),
              ),
              RaisedButton(
                onPressed: () async {
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
                  await _user
                      .collection('AddTeacher')
                      .doc(ds.id)
                      .delete()
                      .then((value) {
                    Navigator.pop(context);
                    // Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TeacherRecord(),
                      ),
                    );
                    Fluttertoast.showToast(
                        msg: "Record Delete Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                },
                child: Text('Delete'),
              ),
            ],
          );
        });
  }

  Widget teacherList() {
    return StreamBuilder<QuerySnapshot>(
      stream: AuthData().fetchTeacher(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            return GestureDetector(
              onTap: () {
                detail(context, ds);
              },
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            ds['Fname'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ds['Lname'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ds['email'],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            );
          },
        )
            : Container(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Record'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(onPressed: () => {},
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Department',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.amber,
              height: 15.0,
            ),
            SingleChildScrollView(child: teacherList()),
          ],
        ),
      ),
    );
  }
}
