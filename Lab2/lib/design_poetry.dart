import 'package:flutter/material.dart';
import 'package:poetry/main.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class MyTitle extends StatefulWidget {
  String ways;

  MyTitle(this.ways);

  @override
  _MyTitleState createState() => _MyTitleState();
}

class _MyTitleState extends State<MyTitle> {
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      Container(
          height: 48.0,
          child: new RaisedButton.icon(
            padding: const EdgeInsets.all(0.0),
            elevation: 0.0,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
              // Navigator.pop(context);
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(0.0),
            ),
            color: Colors.blueGrey[700],
            icon: new Row(children: [
              Icon(Icons.keyboard_arrow_left_rounded),
              Icon(Icons.book)
            ]),
            label: Text(
              "${widget.ways}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          )),
      Expanded(child: Container(color: null)),
      Container(
        height: 48.0,
        width: 56.0,
        child: new RaisedButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(0.0),
          ),
          elevation: 0.0,
          textColor: Colors.white,
          color: Colors.blueGrey[700],
          onPressed: () {},
          child: new Row(
            children: <Widget>[new Icon(Icons.settings)],
          ),
        ),
      )
    ]);
  }
}
class MyBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.orange[50],
        child: new Column(
          children: [
            Container(),
            Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12.0),
                    color: Colors.white,
                    child: new SingleChildScrollView(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                'https://us.123rf.com/450wm/jemastock/jemastock2006/jemastock200610353/150259070-text-book-fill-style-icon-vector-illustration-design.jpg?ver=6',
                              ),
                              backgroundColor: Colors.lightBlue[700],
                            ),
                            new Container(
                                padding: const EdgeInsets.all(24.0),
                                child: new ButtonTheme(
                                    height: 48.0,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(18.0),
                                    ),
                                    buttonColor: Colors.lightBlue[700],
                                    child: new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.center,
                                        children: <Widget>[
                                          new RaisedButton(
                                            elevation: 0.0,
                                            textColor: Colors.white,
                                            onPressed: () {},
                                            child: new Row(children: <Widget>[
                                              new Icon(Icons.search),
                                              new Text(" Search ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w900))
                                            ]),
                                          ),
                                          new Container(height: 12.0),
                                          new RaisedButton(
                                            elevation: 0.0,
                                            textColor: Colors.white,
                                            onPressed: () {},
                                            child: new Row(children: <Widget>[
                                              new Icon(Icons.list),
                                              Text(" Authors ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w900))
                                            ]),
                                          ),
                                          new Container(height: 12.0),
                                          new RaisedButton(
                                            elevation: 0.0,
                                            textColor: Colors.white,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HistoryPage()),
                                              );
                                            },
                                            child: new Row(children: <Widget>[
                                              new Icon(Icons.history),
                                              new Text(" History ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w900))
                                            ]),
                                          ),
                                          new Container(height: 12.0),
                                          new RaisedButton(
                                            elevation: 0.0,
                                            textColor: Colors.white,
                                            onPressed: () {},
                                            child: new Row(children: <Widget>[
                                              new Icon(Icons.star_rate),
                                              new Text(" Rating ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w900))
                                            ]),
                                          ),
                                          new Container(height: 12.0),
                                          new RaisedButton(
                                            elevation: 0.0,
                                            textColor: Colors.white,
                                            onPressed: () {},
                                            child: new Row(children: <Widget>[
                                              new Icon(Icons.casino),
                                              new Text(" Random selection ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w900))
                                            ]),
                                          ),
                                        ]))),
                          ],
                        )))),
            Container()
          ],
        ));
  }
}

class HistoryBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.orange[50],
        child: new Column(
            children: [
              Container(),
              Expanded(
                  child: new ButtonTheme(
                      height: 54.0,
                      buttonColor: Colors.white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                      ),
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new RaisedButton(
                              onPressed: () {},
                              elevation: 0.0,
                              textColor: Colors.black,
                              child: new Row(
                                children: [
                                  new Icon(Icons.directions_boat_outlined,
                                      color: Colors.red),
                                  new Column(
                                    children: [
                                      new Text("  Bunin I. A. ",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w900)),
                                      new Text("  Sapsan ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            new Container(
                              height: 1.0,
                              width: MediaQuery.of(context).size.width,
                            ),
                            new RaisedButton(
                              onPressed: () {},
                              elevation: 0.0,
                              textColor: Colors.black,
                              child: new Row(
                                children: [
                                  new Icon(Icons.directions_boat_outlined,
                                      color: Colors.red),
                                  new Column(
                                    children: [
                                      new Text("  Bunin I. A. ",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w900)),
                                      new Text("  Sapsan ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ]))),
              Container()
            ]));
  }
}