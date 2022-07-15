import 'dart:html';

import 'package:flutter/foundation.dart';
class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class StatefulWidget {
}

class _viewState extends State<view> {
  get futureData => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        FutureBuilder <List<Data>>(
        future: futureData,
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Data> data = snapshot.data;
        return
          ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 75,
                  color: Colors.white,
                  child: Center(child: Text(data[index].title),
                  ),);
              }
          );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
    );
  }
}

class BuildContext {
}

class Center {
}

class Colors {
}

class State {
}
