import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuition_manager/HomePage.dart';
import 'package:tuition_manager/Manager/academy_registration.dart';
import 'package:tuition_manager/Manager/change_password.dart';
import 'package:tuition_manager/Manager/course_cards.dart';


class Manager_home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Academy Manager Dashboard',style:TextStyle(color: Colors.white),),
          actions: [
            Positioned(
              top: 80,
              right: 30,

              child: GestureDetector(
                  onTap: () {

                     // Navigator.pushReplacement(context,
                     //   MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: IconButton(
                    icon: Icon(Icons.logout, color: Colors.white,),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));

                    },
                  )
              ),
            ),

          ],
          centerTitle: true,
          backgroundColor: Colors.cyan[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/homeimages/background.png.JPG'),
                  fit: BoxFit.cover

              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Colors.white,
                  height: 15,
                  thickness: 5,
                  indent: 50,
                  endIndent: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAcademyPage(),));
                              },
                              child: Card(
                                elevation: 24,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: <Widget>[

                                      Container(
                                        width: 110,
                                        height: 80,
                                        child: Image.asset('assets/images/Manager/academy.png'),
                                      ),
                                      SizedBox(height: 5,),
                                      Text("Academy Registration",textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),

                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(width: 15,),
                          GestureDetector(
                              onTap: (){
                                //    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectStatus(),));
                              },
                              child:
                              Card(
                                elevation: 24,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: 110,
                                        height: 80,
                                        child: Image.asset('assets/images/teacher/registration.png'),
                                      ),
                                      SizedBox(height: 5,),
                                      Text("View  Requests",textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),

                                    ],
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: (){
                                //      Navigator.push(context, MaterialPageRoute(builder: (context)=>SviewSlot(),));
                              },
                              child:
                              Card(
                                elevation: 24,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: 110,
                                        height: 80,
                                        child: Image.asset('assets/images/Manager/student.png'),
                                      ),
                                      SizedBox(height: 5,),
                                      Text("View Registered Students",textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),

                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(width: 15,),
                          GestureDetector(
                              onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Course_card(),));
                              },
                              child:
                              Card(
                                elevation: 24,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: 110,
                                        height: 80,
                                        child: Image.asset('assets/images/Student/activatedCourses.png'),
                                      ),
                                      SizedBox(height: 5,),
                                      Text("Add Cources",textAlign: TextAlign.center,style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),),
                                      SizedBox(height: 10,),

                                    ],
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),


                    ],
                  ),

                ),     //******************************************************
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: (){
                                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SdownloadT(),));
                              },
                              child:
                              Card(
                                elevation: 24,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                ),
                              )
                          ),

                          SizedBox(width: 15,),
                          GestureDetector(
                              onTap: (){
                                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SuploadD(),));
                              },
                              child:
                              Card(
                                elevation: 24,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: <Widget>[
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        ],
                      ),
                    ],
                  ),
                ),  //*********************************************************
              ],
            ),
          ),
        ),
      ),
    );
  }

}