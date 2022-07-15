import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class delete extends StatefulWidget {
  const delete({Key? key}) : super(key: key);

  @override
  State<delete> createState() => _deleteState();
}

class _deleteState extends State<delete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        class QuoteCard extends StatelessWidget {


        final Function? delete;
        QuoteCard({ required this.quote, this.delete });

        @override
                Widget build(BuildContext context) {
        return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Padding(
        padding: const EdgeInsets.all(12.0),
                           child: Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: <Widget>[
                               Text(
                         quote.text,
                 style: TextStyle(
                     fontSize: 18.0,
                    color: Colors.grey[600],
        ),
        ),
                   SizedBox(height: 6.0),
        Text(
                  quote.author,
        style: TextStyle(
        fontSize: 14.0,
                   color: Colors.grey[800],
        ),
        ),               SizedBox(height: 8.0),
                                 TextButton.icon(
                            onPressed: () => delete,
                                  label: Text('delete quote'),
                            icon: Icon(Icons.delete),
        )
        onPressed: () {
        if (delete != null) {
        delete();
        }
        },
        ]
    );
  }
}
