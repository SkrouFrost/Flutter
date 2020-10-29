import 'package:flutter/material.dart';
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
    return Row(children: <Widget>[
      Container(
          height: 48.0,
          child: RaisedButton.icon(
            padding: const EdgeInsets.all(0.0),
            elevation: 0.0,
            textColor: Colors.white,
            onPressed: () => Navigator.pushNamed(context, '/'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            color: Colors.blueGrey[700],
            icon: Row(children: [
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
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          elevation: 0.0,
          textColor: Colors.white,
          color: Colors.blueGrey[700],
          onPressed: () => Navigator.pushNamed(context, '/favorite'),
          child: Row(
            children: <Widget>[Icon(Icons.settings)],
          ),
        ),
      )
    ]);
  }
}

class MainBody extends StatelessWidget {
  Widget circle_image() {
    return CircleAvatar(
      radius: 50.0,
      backgroundImage: NetworkImage(
        'https://us.123rf.com/450wm/jemastock/jemastock2006/jemastock200610353/150259070-text-book-fill-style-icon-vector-illustration-design.jpg?ver=6',
      ),
      backgroundColor: Colors.lightBlue[700],
    );
  }

  Widget search() {
    return RaisedButton(
      elevation: 0.0,
      textColor: Colors.white,
      onPressed: () {},
      child: Row(children: <Widget>[
        Icon(Icons.search),
        Text(" Search ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))
      ]),
    );
  }

  Widget autors() {
    return RaisedButton(
      elevation: 0.0,
      textColor: Colors.white,
      onPressed: () {},
      child: Row(children: <Widget>[
        Icon(Icons.list),
        Text(" Authors ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))
      ]),
    );
  }

  Widget history(context) {
    return RaisedButton(
      elevation: 0.0,
      textColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, '/history'),
      child: Row(children: <Widget>[
        Icon(Icons.history),
        Text(" History ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))
      ]),
    );
  }

  Widget favorite(context) {
    return RaisedButton(
      elevation: 0.0,
      textColor: Colors.white,
      onPressed: () => Navigator.pushNamed(context, '/favorite'),
      child: Row(children: <Widget>[
        Icon(Icons.favorite),
        Text(" Favorite ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))
      ]),
    );
  }

  Widget randm() {
    return RaisedButton(
      elevation: 0.0,
      textColor: Colors.white,
      onPressed: () {},
      child: Row(children: <Widget>[
        Icon(Icons.casino),
        Text(" Random selection ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))
      ]),
    );
  }

  Widget pud() {
    return Container(height: 12.0);
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.orange[50],
        child: Column(
          children: <Widget>[
            Container(),
            Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(12.0),
                    color: Colors.white,
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        circle_image(),
                        Container(
                            padding: const EdgeInsets.all(24.0),
                            child: ButtonTheme(
                                height: 48.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                buttonColor: Colors.lightBlue[700],
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      search(),
                                      pud(),
                                      autors(),
                                      pud(),
                                      history(context),
                                      pud(),
                                      favorite(context),
                                      pud(),
                                      randm(),
                                    ]))),
                      ],
                    )))),
            Container()
          ],
        ));
  }
}
