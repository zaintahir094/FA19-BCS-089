import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../services/database.dart';

class ManagerRecord extends StatefulWidget {
  const ManagerRecord({Key? key}) : super(key: key);

  @override
  _ManagerRecordState createState() => _ManagerRecordState();
}

class _ManagerRecordState extends State<ManagerRecord> {

  Widget ManagerList() {
    return StreamBuilder<QuerySnapshot>(
      stream: AuthData().fetchPanel(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot dc = snapshot.data!.docs[index];
            return GestureDetector(
              onTap: () {

              },
              child: Column(

                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('manager ${index+1}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,

                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          dc['Name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20.0,),
                      Expanded(
                        child: Text(
                          dc['email'],
                          textAlign: TextAlign.center,
                        ),
                      ),
                        // IconButton(
                        //   onPressed: () => {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => UpdateProjectPage(
                        //             id: 'id'),
                        //       ),
                        //     )
                        //   },
                        //
                        //   icon: Icon(
                        //     Icons.edit,
                        //     color: Colors.green,
                        //   ),
                        // ),
                        // IconButton(
                        //   onPressed: () =>{
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => UpdateProjectPage(
                        //             id: 'id'),
                        //       ),
                        //     )
                        //   },
                        //   icon: Icon(
                        //     Icons.delete,
                        //     color: Colors.red,
                        //   ),
                        // ),

                    ],
                  ),
                  Divider(
                    color: Colors.amber,
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
        title: Text('Manager Record'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(onPressed: () => {},
              icon: Icon(Icons.search))
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(child: ManagerList(),),),
    );
  }
}
