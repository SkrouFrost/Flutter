import 'package:flutter/material.dart';
import 'package:poetry/history.dart' as globals;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class VirshBody extends StatefulWidget {
  @override
  _VirshBodyState createState() => _VirshBodyState();
}

class _VirshBodyState extends State<VirshBody> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.orange[50],
        child: Column(children: <Widget>[
          Container(
            child: FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(snapshot.data.title,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w900)),
                          Text(
                              " \n ${snapshot.data.body} \n\n ${snapshot.data.body} \n",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900))
                        ],
                      )));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          Container()
        ]));
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get('https://jsonplaceholder.typicode.com/posts/${globals.Glob.nupls}');

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load poem');
  }
}

class Album {
  final String body;
  final int id;
  final String title;

  Album({this.body, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      body: json['body'],
      id: json['id'],
      title: json['title'],
    );
  }
}
