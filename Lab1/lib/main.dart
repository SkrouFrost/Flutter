import 'dart:math';
import 'package:flutter_app7/myfile.dart';

import 'package:flutter/material.dart';

void main() {
  var code = 13442;
  Books books = Books("Kateryna", code);
  books.display();
  Function cipher(int cod){
    return(int cypher) => cypher==12?cypher*cod:cod+1440;
  }
  Function function = cipher(code);
  int res1 = function(6);
  int res2 = function(12);
  print('\n');
    print('First cypher: $res1');
    print("Second cypher: $res2");
    print('\n');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Заяц ТI-72',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Заяц К. з ТI-72'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
/////////////////////////////////////////////////////////////
class _MyHomePageState extends State<MyHomePage> {

  var characters1 = ['Red', 'Blind', 'Mavr', 'Pikachu', 'Raichu', 'Sloupok', 'Sloubro', 'Keys', 'Lamp', 'Skittle'];
  int _counter = 0;    final rand = Random();
  String d;
  void _incrementCounter() {

    setState(() {
      _counter = rand.nextInt(10);
    });
  }
  @override
  Widget build(BuildContext context) {
    d = characters1[_counter];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You got this character :',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepOrangeAccent)),
            Text(
              '$d',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Pers',
        child: Icon(Icons.add_box),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
