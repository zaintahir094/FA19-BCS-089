import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuition_manager/Student/list_courses/10th_list.dart';

import 'package:tuition_manager/Student/list_courses/9th_list.dart';


class St_Course_card extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan[900],
        appBar: AppBar(
          title: Text(' View Courses',style:TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
        ),
        body: SingleChildScrollView(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>List9thViewPage(),));
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
                                    ),
                                    SizedBox(height: 5,),
                                    Text("Student",textAlign: TextAlign.center,style: TextStyle(
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>List10thViewPage(),));
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
                                    ),
                                    SizedBox(height: 5,),
                                    Text("Teachers",textAlign: TextAlign.center,style: TextStyle(
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
                ),
                //******************************************************

              //*********************************************************
            ],
          ),
        ),
      ),
    );
  }

}