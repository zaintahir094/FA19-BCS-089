import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../services/text_field.dart';


class TeacherSignup extends StatefulWidget {
  @override
  _TeacherSignupState createState() => _TeacherSignupState();
}

class _TeacherSignupState extends State<TeacherSignup> {
  TextEditingController tchrnameEditingController =
  new TextEditingController();
  TextEditingController tchrdepartmentEditingController =
  new TextEditingController();
  TextEditingController tchremailEditingController =
  new TextEditingController();
  TextEditingController tchrphonenumberEditingController =
  new TextEditingController();
  TextEditingController tchrpasswordEditingController =
  new TextEditingController();

  addTeacher() async {
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
            .SignUpWithEmailandPassword(
            tchremailEditingController.text,
            tchrpasswordEditingController.text,
            tchrnameEditingController.text,
            tchrdepartmentEditingController.text,
            tchrphonenumberEditingController.text,
            'teacher')
            .then((value) {
          if (value != null) {
            value.sendEmailVerification().then((value) async {
              await AuthData().addSlot(5, tchremailEditingController.text);
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TeacherSignup(),
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
                msg: "Teacher already exist",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }).catchError((e) {
          Navigator.pop(context);
          print(e.toString());
          Fluttertoast.showToast(
              msg: e.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }
    } catch (e) {
      Navigator.pop(context);
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Teacher Signup'),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/choose_field/bg.jpg'),
                fit: BoxFit.cover
            )
        ),
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: tchrnameEditingController,
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

                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: tchrdepartmentEditingController,
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
                              hintText: 'Department',
                              border: InputBorder.none,
                            ),
                          ),
                        ),

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
                            controller: tchremailEditingController,
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


                        TextFieldContainer(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: tchrphonenumberEditingController,
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
                            controller: tchrpasswordEditingController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.password,
                                color: Colors.lightBlueAccent,
                              ),
                              hintText: 'Password',
                              // labelText: 'like sp18-bse-b10-042',
                              border: InputBorder.none,
                            ),
                            //controller: userpasswordEditingController,
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
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              color: Colors.green,
                              onPressed: () {
                                addTeacher();
                              },
                              child: Text(
                                'Sign UP',
                                style: TextStyle(color: Colors.black,),
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
