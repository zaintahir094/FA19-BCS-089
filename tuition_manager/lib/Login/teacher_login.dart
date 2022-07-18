import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuition_manager/Forget%20pages/teacher_forget_password.dart';
import 'package:tuition_manager/Teacher/Teacher_home.dart';
import 'package:tuition_manager/signup/teachers.dart';
import '../services/authorization_management.dart';

class Teacher extends StatefulWidget{
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  String email = "";
  String password = "";
  GoogleSignIn googleAuth= GoogleSignIn();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/homeimages/background.png.JPG'),
                fit: BoxFit.cover
            )
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.cyan[900],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(48),
                          topRight: Radius.circular(48))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "Teacher Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30),
                          ),
                        ),

                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: "Email",
                              hintText: "Enter Email ID",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: "Password",
                              hintText: "Enter Password",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance.signInWithEmailAndPassword(
                                  email: email,
                                  password: password
                              );
                              bool autorized = await AuthorizationManagementService().authorizeMe(context, "teacher");
                              if(autorized) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Teacher_home()));
                              }else{
                                print("Not Authorized");
                              }
                            }
                            on FirebaseAuthException catch (e){
                              if(e.code == 'Email Not Found'){
                                print('No Admin Found for the email');
                              }else if (e.code == 'Wrong Password'){
                                print('Wrong password provide for admin');
                              }
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 24, horizontal: 20),
                            height: 46,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            child: Row(
                              children: <Widget>[
                                Text('Do you not have account?'

                                ),

                                FlatButton(
                                  textColor: Colors.blue,
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {

                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherSignup(),));
                                    //signup screen
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TForgotPassword(),));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 24, horizontal: 20),
                                      child: Center(
                                        child: Text(
                                          "Forgot Password ? ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],

                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );

  }
}