import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poetry/Model/history_m.dart';
import 'package:poetry/Model/favorite_m.dart';

class HistoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.orange[50],
        child: Column(children: <Widget>[
          Container(),
          Expanded(
              child: CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _MyListItem(index)),
            ),
          ])),
          Container()
        ]));
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavorite = context.select<FavoriteModel, bool>(
      (favorite) => favorite.items.contains(item),
    );

    return FlatButton(
      onPressed: isInFavorite
          ? null
          : () {
              var favorite = context.read<FavoriteModel>();
              favorite.add(item);
            },
      splashColor: Colors.white,
      child: isInFavorite
          ? Icon(Icons.favorite, semanticLabel: 'ADDED', color: Colors.red)
          : Icon(Icons.favorite_border, semanticLabel: 'ADD'),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

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
          poem_info(context)
        ],
      ),
    );
  }

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<HistoryModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );

    return ButtonTheme(
        height: 54.0,
        buttonColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Row(children: [
          Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                poem_button(item.name),
                Divider(
                  height: 1,
                  color: Colors.orange[50],
                )
              ])),
          Expanded(
              child: Container(
            color: Colors.white,
            height: 54,
          )),
          Container(child: _AddButton(item: item))
        ]));
  }
}
