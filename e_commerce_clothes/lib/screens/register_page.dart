import 'package:e_commerce_clothes/screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/Custom_btn.dart';
import '../widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
     /*return Scaffold(
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
                  "Create New Account",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInput(hintText: "Email..."),
                  CustomInput(hintText: 'Password...'),
                  Custombtn(
                    text: "Create New Account",
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
                  text:"Back to Login",
                  onPressed: (){
                    Navigator.pop(context);

                  },
                  outlineBtn:true,
                ),
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
