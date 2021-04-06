import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/favorite_m.dart';
import 'Model/requests_m.dart';
import 'request.dart';
import 'requests.dart';
import 'favorite.dart';
import 'login.dart';
import 'registration.dart';
import 'form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => RequestsModel()),
          ChangeNotifierProxyProvider<RequestsModel, FavoriteModel>(
            create: (context) => FavoriteModel(),
            update: (context, requests, favorite) {
              favorite.requests = requests;
              favorite.starts();
              return favorite;
            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Start-Team Demo ',
          initialRoute: '/',
          routes: {
            '/': (context) => MyLogin(),
            '/registration': (context) => MyRegistration(),
            '/form': (context) => MyForm(),
            '/requests': (context) => RequestsPage(),
            '/favorite': (context) => FavoritePage(),
          },
          // home: MainPage()
        ));
  }
}

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
            textColor: Colors.black,
            onPressed: () => Navigator.pushNamed(context, '/requests'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            color: Colors.yellow,
            icon: Icon(Icons.keyboard_arrow_left_rounded),
            label: Text(
              "${widget.ways}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          )),
      Expanded(child: Container(color: Colors.black)),
      Container(
        height: 48.0,
        width: 56.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          elevation: 0.0,
          textColor: Colors.black,
          color: Colors.yellow,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            children: <Widget>[Icon(Icons.search)],
          ),
        ),
      )
    ]);
  }
}

class RequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.yellow,
                title: MyTitle('Заявка  '))),
        body: RequestBody(),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.all(12.0),
            children: <Widget>[
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Усі заявки'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestsPage()));
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Мої заявки'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Відмічені заявки'),
                onTap: () => Navigator.pushNamed(context, '/favorite'),
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Налаштування'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Кабінет'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.yellow,
                title: MyTitle('Усі заявки  '))),
        body: RequestsBody(),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.all(12.0),
            children: <Widget>[
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Усі заявки'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestsPage()));
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Мої заявки'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Відмічені заявки'),
                onTap: () => Navigator.pushNamed(context, '/favorite'),
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Налаштування'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Кабінет'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.yellow,
                title: MyTitle('Відмічені заявки  '))),
        body: FavoriteBody(),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.all(12.0),
            children: <Widget>[
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Усі заявки'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestsPage()));
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Мої заявки'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Відмічені заявки'),
                onTap: () => Navigator.pushNamed(context, '/favorite'),
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Налаштування'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                tileColor: Colors.yellow,
                title: Text('Кабінет'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
