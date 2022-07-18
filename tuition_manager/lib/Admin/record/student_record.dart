import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tuition_manager/Admin/record/studentRecordDetailPage.dart';
import '../../services/database.dart';


class StudentsRecord extends StatefulWidget {
  @override
  _StudentsRecordState createState() => _StudentsRecordState();
}

class _StudentsRecordState extends State<StudentsRecord> {


  Widget StudentList() {
    return StreamBuilder<QuerySnapshot>(
      stream: AuthData().fetchStudent(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot dc = snapshot.data!.docs[index];
            return GestureDetector(
              onTap: () {
                // detail(dc, context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StudentDetailPage(context: context,dc: dc,),
                  ),
                );
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          dc['name'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          dc['email'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          dc['phoneNumber'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '',
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

        title: Text('Students Record'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(onPressed: () => {},
              icon: Icon(Icons.search))
        ],
      ),

      body: Column(

        children: [
          SizedBox(
            height: 15,
          ),
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
                  'Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Phone Number',
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
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(child: StudentList()),
        ],
      ),
    );
  }
}
