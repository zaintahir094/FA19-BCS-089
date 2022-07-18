import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuition_manager/Admin/record/student_record.dart';

import '../../services/text_field.dart';

class StudentDetailPage extends StatefulWidget {
  DocumentSnapshot dc;
  BuildContext context;
  StudentDetailPage({required this.context,required this.dc});

  @override
  _StudentDetailPageState createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  late String _Fname = widget.dc['name'],
      _email = widget.dc['email'],
      _phoneNumber = widget.dc['phoneNumber'];
  FirebaseFirestore _user = FirebaseFirestore.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? _value;
  Widget dropdown() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("AddManager").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print('Text phrase');
          return Text('Loading');
        } else {
          List<DropdownMenuItem> _list = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
             DocumentSnapshot snap = snapshot.data!.docs[i];
            _list.add(
              DropdownMenuItem(
                child:Text('${i+1} Manager'),
                value: "${snap['email']}",
              ),
            );
          }
          return DropdownButton<dynamic>(
            value: _value,
            onChanged: (_val) {
              setState(() {
                _value = _val as String?;
              });
            },
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            isExpanded: true,
            dropdownColor: Colors.white,
            items: _list,
            hint: new Text(
              "Select Manager",
              style: TextStyle(color: Colors.black),
            ),
          );
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record of Student'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/choose_field/bg.jpg'),
                fit: BoxFit.cover
            )
        ),
        width: double.infinity,
        child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(

                      initialValue: widget.dc['name'],
                      cursorColor: Colors.green,
                      style: TextStyle(color: Colors.green, fontSize: 16),
                      validator: (val) {
                        return val!.isEmpty || val.length < 3
                            ? "Enter Name 3+ characters"
                            : null;
                      },
                      decoration: InputDecoration(
                          labelText: 'First Member Name',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),),),
                      onChanged: (_val) {
                        setState(() {
                          _Fname = _val;
                        });
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      initialValue: widget.dc['email'],
                      cursorColor: Colors.green,
                      style: TextStyle(color: Colors.green, fontSize: 16),
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
                              borderSide: BorderSide(color: Colors.amber),),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),),),
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      initialValue: widget.dc['phoneNumber'],
                      maxLength: 11,
                      onChanged: (_val) {
                        setState(() {
                          _phoneNumber = _val;
                        });
                      },
                      cursorColor: Colors.green,
                      style: TextStyle(color: Colors.green, fontSize: 16),
                      validator: (val) {
                        return val!.length < 11 && val.length>11
                            ? "Phone # be like 03000000000"
                            : null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:  Colors.amber))),
                    ),
                    SizedBox(height: 8.0),
                    TextFieldContainer(
                      child: dropdown(),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        await _user.collection('AddStudent').doc(widget.dc.id).update({
                          'name': _Fname,
                          'email': _email,
                          'phoneNumber': _phoneNumber,
                          'role': 'student',
                          'time': DateTime.now()
                        }).then((value)async{
                          if(_value!.isNotEmpty){
                            Map<String,dynamic> data={
                              "Name":widget.dc['name'],
                              "PhoneNumber":widget.dc['phoneNumber'],
                              "StudentEmail":widget.dc['email'],
                              'time': DateTime.now(),
                            };
                            await _user.collection("Manager_Students").doc(_value).collection("MyStudents").add(data);
                          }
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => StudentsRecord(),
                            ),
                          );
                          Fluttertoast.showToast(
                              msg: "Record Update Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });
                      }
                    },
                    child: Text('Update'),
                  ),
                  SizedBox(width: 30.0,),
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
                          .collection('AddStudent')
                          .doc(widget.dc.id)
                          .delete()
                          .then((value) {
                        Navigator.pop(context);
                        // Navigator.pop(context);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => StudentsRecord(),
                          ),
                        );
                        Fluttertoast.showToast(
                            msg: "Record Delete Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.green,
                            fontSize: 16.0);
                      });
                    },
                    child: Text('Delete'),
                  ),
                ],
              )
            ],

          ),
        ),
      ),
    ],
    ),
      ),
    );
  }
}
