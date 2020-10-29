import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poetry/Model/favorite_m.dart';

class FavoriteBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.orange[50],
        child: Column(children: [
          Expanded(
            child: _favoriteList(),
          ),
          _favoriteTotal(),
        ]));
  }
}

class _favoriteList extends StatelessWidget {

  Widget poem_info(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("  Brodskiy I. A. ",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
        Text("  $context ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900))
      ],
    );
  }

  Widget poem_button(context) {
    return RaisedButton(
      onPressed: () {},
      elevation: 0.0,
      textColor: Colors.black,
      child: Row(
        children: <Widget>[
          Icon(Icons.directions_boat_outlined, color: Colors.red),
          poem_info(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var favorite = context.watch<FavoriteModel>();
    return ListView.builder(
      itemCount: favorite.items.length,
      itemBuilder: (context, index) => ButtonTheme(
          height: 54.0,
          buttonColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            poem_button(favorite.items[index].name),
            Divider(
              height: 1,
              color: Colors.orange[50],
            ),
          ])),
    );
  }
}

class _favoriteTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline3.copyWith(fontSize: 24);

    return SizedBox(
      height: 140,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<FavoriteModel>(
                builder: (context, favorite, child) => Text(
                    'Here are ${favorite.totalScore} poems',
                    style: hugeStyle)),
            SizedBox(width: 24),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Sorry, it`s impossible now(',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w900))));
              },
              color: Colors.white,
              child: Text('Delete all',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900)),
            ),
          ],
        ),
      ),
    );
  }
}
