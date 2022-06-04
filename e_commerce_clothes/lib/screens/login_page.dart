import 'package:e_commerce_clothes/screens/register_page.dart';
import 'package:e_commerce_clothes/widgets/Custom_btn.dart';
import 'package:e_commerce_clothes/widgets/custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        body: SafeArea(
          child: Container(
          width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 24.0
            ),
            child: Text(
                "Welcome User,\nlogin to your account",
              textAlign: TextAlign.center,
              style: Constants.boldHeading,
            ),
          ),
          Column(
            children: [
              CustomInput(hintText: "Email..."),
              CustomInput(hintText: 'Password...'),
             Custombtn(
               text: "Login",
               onPressed: (){
                 print("Clicked the Login Button");
               },
             ),
            ],
          ),
        Padding(
          padding: const EdgeInsets.only(
            bottom:16.0,
          ),

          child: Custombtn(
             text:"Create new Account",
            onPressed: (){
            //  Navigator.push(
              //    context,
               //   MaterialPageRoute(
                 //     builder:(context) => RegisterPage()
               //   ),
            //  );
             },
            outlineBtn:true,
           ),
        ),
        ],
      ),
          ),
    ),
    );
  }
}
