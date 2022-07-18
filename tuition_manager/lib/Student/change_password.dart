import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Student_home.dart';


class Schange extends StatefulWidget {

  @override
  _SchangeState createState() => _SchangeState();
}

class _SchangeState extends State<Schange> {
  @override
  Widget build(BuildContext context) {
    String  Password = "";
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('images/choose_field/bg.jpg'),
        //         fit: BoxFit.cover
        //     )
        // ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 100,
              child: Center(
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(48),
                          topRight: Radius.circular(48))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Text(
                            "Please Enter New Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: TextField(
                            onChanged: (text) {
                              Password = text;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: " New Password",
                              hintText: "New Password",
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
                          padding: const EdgeInsets.only(top: 40),
                          child: Text(
                            "Please Confirm New Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: TextField(
                            onChanged: (text) {
                              Password = text;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: " Confirm Password",
                              hintText: "Confirm New Password",
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
                        SizedBox(height: 50,),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await FirebaseAuth.instance.currentUser?.updatePassword(Password);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Student_home()));
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
                                          "Change",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],

                              )
                            ],
                          ),
                        ),

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
