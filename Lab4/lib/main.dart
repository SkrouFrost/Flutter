import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poetry/Model/favorite_m.dart';
import 'package:poetry/Model/history_m.dart';
import 'package:poetry/main_page.dart';
import 'package:poetry/favorite.dart';
import 'package:poetry/history.dart';
import 'package:poetry/virsh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => HistoryModel()),
          ChangeNotifierProxyProvider<HistoryModel, FavoriteModel>(
            create: (context) => FavoriteModel(),
            update: (context, history, favorite) {
              favorite.history = history;
              favorite.starts();
              return favorite;

            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Provider Demo',
          initialRoute: '/',
          routes: {
            '/': (context) => MainPage(),
            '/history': (context) => HistoryPage(),
            '/favorite': (context) => FavoritePage(),
            '/virsh':(context) => VirshPage(),
          },
          // home: MainPage()
        ));
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.blueGrey[700],
                title: MyTitle('Russian poetry  '))),
        body: MainBody());
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.blueGrey[700],
                title: MyTitle('History  '))),
        body: HistoryBody());
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
                backgroundColor: Colors.blueGrey[700],
                title: MyTitle('Favorite  '))),
        body: FavoriteBody());
  }
}

class VirshPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: AppBar(
                titleSpacing: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.blueGrey[700],
                title: MyTitle('Poem  '))),
        body: VirshBody());
  }
}
