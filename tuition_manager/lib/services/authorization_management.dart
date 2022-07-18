import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationManagementService{
  Future<bool> authorizeMe(BuildContext context, String role) async{
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      var stdData;
      if(role == "student"){
        stdData = await FirebaseFirestore.instance.collection("/AddStudent").doc(user.uid).get();
      }else if (role == "teacher"){
        stdData = await FirebaseFirestore.instance.collection("/AddTeacher").doc(user.uid).get();
      } else if (role == "manager"){
        stdData = await FirebaseFirestore.instance.collection("/AddManager").doc(user.uid).get();
      }
      if(stdData.exists){
        if(stdData["role"]==role){
          print(stdData);
          return true;
        }
      }
      Fluttertoast.showToast(
          msg: "Email/Password is wrong",
      toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
    return false;
  }
}