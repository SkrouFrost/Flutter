import 'package:flutter/material.dart';
import 'package:poetry/design_poetry.dart'; // подключаем библиотеку material

void main() {
  runApp(
      new MaterialApp(debugShowCheckedModeBanner: false, home: new MainPage()));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: new AppBar(
                leading: new Container(),
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.blueGrey[700],
                title: new MyTitle("Russian poetry  "))),
        body: new MyBody());
    // Navigator.pop(context);
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: new AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.blueGrey[700],
                title: new MyTitle('History  '))),
        body: new HistoryBody());
  }
}
