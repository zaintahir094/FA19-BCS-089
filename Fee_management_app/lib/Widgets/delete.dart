import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class delete extends StatefulWidget {
  const delete({Key? key}) : super(key: key);

  @override
  State<delete> createState() => _deleteState();
}

class _deleteState extends State<delete> {
  Widget build(BuildContext context) {
    return Scaffold(
        class QuoteCard extends StatelessWidget {

        final Function? delete;
        QuoteCard({ required this.quote, this.delete });
        Widget build(BuildContext context) {
        return Card(static Future<void> deleteItem({
        required String docId,
        }) async {
        DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

        await documentReferencer
            .delete()
            .whenComplete(() => print('Note item deleted from the database'))
            .catchError((e) => print(e));
        }
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
